import 'package:flutter/material.dart';
import 'capture_image.dart'; // Import the new page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment 2',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.teal), // Updated color
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Assignment: Task_2'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  void _navigateToCaptureImagePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CaptureImagePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.teal, // Updated color
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.image, // Icon for picking image
                  size: 50,
                  color: Colors.teal, // Icon color
                ),
                SizedBox(width: 10), // Space between icon and text
                Flexible(
                  child: Text(
                    'Welcome to Assignment Task 2!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold, // Bold text
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'This app demonstrates how to capture and display images. '
              'You can capture an image using your device’s camera, display the image on the screen, and upload it if needed.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18, // Normal font size
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _navigateToCaptureImagePage(context),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.teal, // Button text color
              ),
              child: Text('Go to Capture Image Page'),
            ),
          ],
        ),
      ),
    );
  }
}
