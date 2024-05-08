import 'package:flutter/material.dart';

// vendor new on home page
class VendorNewsPage extends StatelessWidget {
  final String title;
  final String details;

  const VendorNewsPage({Key? key, required this.title, required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(color: Colors.white), // Set title color to white
        ),
        backgroundColor: const Color(0xFFDEAD00), // Set background color of the app bar
      ),
      backgroundColor: const Color(0xFFDEAD00), // Set background color of the scaffold body
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white), // Set text color
            ),
            SizedBox(height: 16),
            Text(
              details,
              style: TextStyle(fontSize: 18, color: Colors.white), // Set text color
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class VendorNewsPage extends StatelessWidget {
//   final String newsId;

//   const VendorNewsPage({Key? key, required this.newsId}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<DocumentSnapshot>(
//       stream: FirebaseFirestore.instance.collection('newsUpdates').doc(newsId).snapshots(),
//       builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Scaffold(
//             appBar: AppBar(
//               title: Text(
//                 'Error',
//                 style: TextStyle(color: Colors.white),
//               ),
//               backgroundColor: const Color(0xFFDEAD00),
//             ),
//             body: Center(
//               child: Text('Error: ${snapshot.error}'),
//             ),
//           );
//         }

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Scaffold(
//             appBar: AppBar(
//               title: Text(
//                 'Loading...',
//                 style: TextStyle(color: Colors.white),
//               ),
//               backgroundColor: const Color(0xFFDEAD00),
//             ),
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         }

//         if (!snapshot.hasData || !snapshot.data!.exists) {
//           return Scaffold(
//             appBar: AppBar(
//               title: Text(
//                 'Not Found',
//                 style: TextStyle(color: Colors.white),
//               ),
//               backgroundColor: const Color(0xFFDEAD00),
//             ),
//             body: Center(
//               child: Text('Document does not exist'),
//             ),
//           );
//         }

//         // Document found, extract title and details
//         final data = snapshot.data!;
//         final title = data['title'] ?? '';
//         final details = data['details'] ?? '';

//         return Scaffold(
//           appBar: AppBar(
//             title: Text(
//               title,
//               style: TextStyle(color: Colors.white), // Set title color to white
//             ),
//             backgroundColor: const Color(0xFFDEAD00), // Set background color of the app bar
//           ),
//           backgroundColor: const Color(0xFFDEAD00), // Set background color of the scaffold body
//           body: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white), // Set text color
//                 ),
//                 SizedBox(height: 16),
//                 Text(
//                   details,
//                   style: TextStyle(fontSize: 18, color: Colors.white), // Set text color
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }



