import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'signUpComplete.dart'; // Import the SignUpCompletePage
import 'auth_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errormessage = '';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errormessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errormessage = e.message;
      });
    }
  }

  Widget _title() {
      return const Text('Firebase Auth');
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
    ){
      return TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: title,
        ),
      );
  }

  Widget _errorMessage() {
      return Text(errormessage == ''? '' : 'Humm ? $errormessage');
  }

  Widget _submitButton() {
      return ElevatedButton(onPressed: isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword, child: Text(isLogin ? 'Login' : 'Register'),);
  }

  Widget _LoginOrRegisterButton(){
      return TextButton(
          onPressed: () {
            setState(() {
              isLogin = !isLogin;
            });
          },
        child: Text(isLogin ? 'Register instead' : 'Login instead'),
      );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _entryField('email', _controllerEmail),
            _entryField('password', _controllerPassword),
            _errorMessage(),
            _submitButton(),
            _LoginOrRegisterButton(),
          ],
        ),
      ),
    );
  }
}



/*class SigningUpPage extends StatelessWidget {
  const SigningUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Simulate a delay of 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      // Navigate to the SignUpCompletePage
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignUpCompletePage()),
      );
    });

    return Scaffold(
      backgroundColor: Color(0xFFDEAD00), // Set the background color to DEAD00
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color.fromARGB(255, 14, 122, 254),
                ),
              ), // Display the loading indicator
              SizedBox(height: 16), // Add some space
              Text(
                'Signing Up...',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 14, 122, 254)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/