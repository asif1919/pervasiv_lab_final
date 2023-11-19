import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';



class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController contactController = TextEditingController();

  late ImagePicker _imagePicker;
  XFile? _profileImage;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  Future<void> _pickProfileImage() async {
    try {
      final XFile? pickedImage = await _imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          _profileImage = pickedImage;
        });
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  Future<void> _takeProfilePicture() async {
    try {
      final XFile? takenImage = await _imagePicker.pickImage(source: ImageSource.camera);
      if (takenImage != null) {
        setState(() {
          _profileImage = takenImage;
        });
      }
    } catch (e) {
      print("Error taking picture: $e");
    }
  }

  Future<void> _showImageSourceDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Choose Image Source"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                GestureDetector(
                  child: Text("Camera"),
                  onTap: () {
                    Navigator.pop(context);
                    _takeProfilePicture();
                  },
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                  child: Text("Gallery"),
                  onTap: () {
                    Navigator.pop(context);
                    _pickProfileImage();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Portfolio'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _showImageSourceDialog,
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: _profileImage != null
                    ? FileImage(File(_profileImage!.path))
                    : null,
                child: _profileImage == null
                    ? Icon(
                        Icons.camera_alt,
                        size: 40.0,
                      )
                    : null,
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: bioController,
              decoration: InputDecoration(
                labelText: 'Bio',
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: contactController,
              decoration: InputDecoration(
                labelText: 'Contact Details',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
