import 'package:flutter/material.dart';

class AddNewsUpdate extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add News Update',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0F8B7C), // Set background color of the app bar
      ),
      backgroundColor: const Color(0xFF0F8B7C), // Set background color of the scaffold body
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title:',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            TextFormField(
              controller: titleController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Enter title',
                hintStyle: TextStyle(color: Colors.white),
                fillColor: Colors.white.withOpacity(0.1),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Content:',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            TextFormField(
              controller: contentController,
              style: TextStyle(color: Colors.white),
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Enter content',
                hintStyle: TextStyle(color: Colors.white),
                fillColor: Colors.white.withOpacity(0.1),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Add functionality to upload picture
                },
                icon: Icon(Icons.upload),
                label: Text('Upload Picture', style: TextStyle(color: Colors.black)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0BC2AC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  saveNewsUpdate(context);
                },
                child: Text('Update News', style: TextStyle(color: Colors.black)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0BC2AC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void saveNewsUpdate(BuildContext context) {
    String title = titleController.text.trim();
    String content = contentController.text.trim();

    // Validate if title and content are not empty
    if (title.isNotEmpty && content.isNotEmpty) {
      // Create the new news update string
      String newNewsUpdate = '$title: $content';
      
      // Pass the new news update back to the previous screen
      Navigator.pop(context, newNewsUpdate);
    } else {
      // Display an error message if title or content is empty
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Title and content cannot be empty.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
