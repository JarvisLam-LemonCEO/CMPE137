import 'package:flutter/material.dart';

class NewsUpdatesView extends StatefulWidget {
  @override
  _NewsUpdatesViewState createState() => _NewsUpdatesViewState();
}

class _NewsUpdatesViewState extends State<NewsUpdatesView> {
  List<String> newsUpdates = [
    'News Update 1',
    'News Update 2',
    'News Update 3',
    'News Update 4',
    'News Update 5',
    'News Update 6', // Duplicate entry for testing
    'News Update 7', // Duplicate entry for testing
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF0F8B7C), // Set the background color
        child: ListView.builder(
          itemCount: newsUpdates.length,
          itemBuilder: (context, index) {
            String newsUpdate = newsUpdates[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewsUpdateDetailsPage(newsUpdate)),
                );
              },
              child: ListTile(
                title: Text(
                  newsUpdate,
                  style: TextStyle(color: Colors.white), // Set text color to white
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.white), // Delete icon
                  onPressed: () {
                    _showDeleteConfirmationDialog(context, newsUpdate);
                  },
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNewsUpdate()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _showDeleteConfirmationDialog(BuildContext context, String newsUpdate) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Confirmation'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to delete this news update?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                // Perform delete action here
                _deleteNewsUpdate(context, newsUpdate);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteNewsUpdate(BuildContext context, String newsUpdate) {
    // Implement your delete logic here
    setState(() {
      newsUpdates.remove(newsUpdate);
    });
  }
}

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
      // Perform action to save news update (e.g., add to list or save to database)
      print('Title: $title, Content: $content');

      // Optionally, display a confirmation message or navigate back to previous screen
      Navigator.pop(context); // Navigate back to the previous screen
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

class NewsUpdateDetailsPage extends StatelessWidget {
  final String newsUpdate;

  NewsUpdateDetailsPage(this.newsUpdate);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Update Details'),
        backgroundColor: Color(0xFF0F8B7C), // Set background color of the app bar
      ),
      body: Container(
        color: Color(0xFF0F8B7C), // Set background color
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              newsUpdate,
              style: TextStyle(fontSize: 20, color: Colors.white), // Change text color to white
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: NewsUpdatesView(),
  ));
}
