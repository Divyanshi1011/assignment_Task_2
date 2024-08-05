import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CaptureImagePage extends StatefulWidget {
  @override
  _CaptureImagePageState createState() => _CaptureImagePageState();
}

class _CaptureImagePageState extends State<CaptureImagePage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _descriptionController = TextEditingController();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _submit() {
    if (_image == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('No image selected. Image is mandatory.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      // Handle the submission process here
      print('Image: ${_image!.path}');
      print('Description: ${_descriptionController.text}');

      // Clear the fields
      setState(() {
        _image = null;
        _descriptionController.clear();
      });

      // Show success message
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Success'),
          content: Text('Image successfully uploaded.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capture Image'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.teal, // Updated color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description (optional)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _pickImage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, // Updated color
                ),
                child: Text('Upload Image'),
              ),
            ),
            SizedBox(height: 20),
            if (_image != null)
              Center(
                child: Image.file(_image!),
              ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, // Updated color
                ),
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
