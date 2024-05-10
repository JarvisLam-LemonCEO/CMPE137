import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tut/hello.dart';
import 'package:local_auth/local_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home.dart';
import 'customerHome.dart';


class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

enum SupportState {
  unknown,
  supported,
  unSupported,
}

class _AuthScreenState extends State<AuthScreen> {
  final LocalAuthentication auth = LocalAuthentication();
  SupportState supportState = SupportState.unknown;
  List<BiometricType>? availableBiometrics;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    auth.isDeviceSupported().then((bool isSupported) =>
        setState(() => supportState = isSupported ? SupportState.supported : SupportState.unSupported));
    super.initState();
    checkBiometric();
    getAvailableBiometrics();
  }

  Future<void> checkBiometric() async {
    late bool canCheckBiometric;
    try {
      canCheckBiometric = await auth.canCheckBiometrics;
      print("Biometric supported: $canCheckBiometric");
    } on PlatformException catch (e) {
      print(e);
      canCheckBiometric = false;
    }
  }

  Future<void> getAvailableBiometrics() async {
    late List<BiometricType> biometricTypes;
    try {
      biometricTypes = await auth.getAvailableBiometrics();
      print("supported biometrics $biometricTypes");
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) {
      return;
    }
    setState(() {
      availableBiometrics = biometricTypes;
    });
  }

  Future<void> authenticateWithBiometrics() async {
    try {
      final authenticated = await auth.authenticate(
          localizedReason: 'Authenticate with fingerprint or Face ID',
          options: const AuthenticationOptions(
            stickyAuth: true,
            biometricOnly: true,
          ));

      if (!mounted) {
        return;
      }

      if (authenticated) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      }
    } on PlatformException catch (e) {
      print(e);
      return;
    }
  }

  void login(String email, String password) async {
    try {
      // Sign in with email and password
      await Auth().signInWithEmailAndPassword(email: email, password: password);

      // Check user role and navigate accordingly
      Auth().checkUserRoleAndNavigate(context);
    } catch (e) {
      // Show an error message if an error occurs during login
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred during login'),
          backgroundColor: Colors.red,
        ),
      );
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double buttonWidth = screenSize.width * 0.7;

    return Scaffold(
      backgroundColor: Colors.transparent, // Set the background color of the scaffold to transparent
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF816DFB), // Start color
              const Color(0xFFFF9DD7), // End color
            ],
            stops: [0, 0.2951], // Set the gradient stops
            tileMode: TileMode.clamp,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding: EdgeInsets.all(15),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding: EdgeInsets.all(15),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Validate the form
                      if (_formKey.currentState!.validate()) {
                        // Handle login button press
                        final enteredEmail = usernameController.text;
                        final enteredPassword = passwordController.text;
                        login(enteredEmail, enteredPassword);
                      }
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'BalooBhai2',
                        fontSize: 20,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFB59CC4),
                      minimumSize: Size(buttonWidth, 46),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: authenticateWithBiometrics,
                    child: const Text(
                      "Login with Face ID",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'BalooBhai2',
                        fontSize: 20,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 14, 122, 254),
                      minimumSize: Size(buttonWidth, 46),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> checkUserRoleAndNavigate(BuildContext context) async {
    try {
      String? userId = _firebaseAuth.currentUser?.uid;
      if (userId != null) {
        DocumentSnapshot userSnapshot =
            await _firestore.collection('users').doc(userId).get();
        String? role = userSnapshot.get('role');
        if (role == 'vendor') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Home()), // Navigate to vendor home
          );
        } else if (role == 'customer') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const CustomerHome()), // Navigate to customer home
          );
        } else {
          // Show an error message if the role is not recognized
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Unknown user role'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else {
        // Show an error message if the user ID is null
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('User ID is null'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      // Show an error message if an error occurs
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred while checking user role'),
          backgroundColor: Colors.red,
        ),
      );
      print('Error: $e');
    }
  }
}





