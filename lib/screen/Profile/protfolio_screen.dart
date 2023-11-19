import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'project_card_widget.dart';
import 'social_button_widget.dart';

class PortfolioScreen extends StatefulWidget {
  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
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
      final XFile? pickedImage =
          await _imagePicker.pickImage(source: ImageSource.gallery);
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
      final XFile? takenImage =
          await _imagePicker.pickImage(source: ImageSource.camera);
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
      backgroundColor: const Color.fromARGB(255, 73, 75, 77),
      // appBar: AppBar(
      //   title: Text(
      //     'Profile',
      //     style: TextStyle(
      //       color: Colors.white.withOpacity(0.7),
      //     ),
      //   ),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _showImageSourceDialog,
                child: CircleAvatar(
                  radius: 70.0,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      controller: bioController,
                      decoration: InputDecoration(
                          labelText: 'Bio',
                          labelStyle: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      controller: contactController,
                      decoration: InputDecoration(
                          labelText: 'Contact Details',
                          labelStyle: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ],
                ),
              ),

              // const CircleAvatar(
              //   radius: 80.0,
              //   backgroundImage: AssetImage(
              //       "assets/icons/profile_picture.jpg"), // Replace with your image asset
              // ),
              // const SizedBox(height: 16.0),
              // Text(
              //   'Asif Ullah',
              //   style: TextStyle(
              //     color: Colors.white.withOpacity(0.7),
              //     fontSize: 24.0,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // Text(
              //   'Flutter | Firebase | Restful APIs | Dart',
              //   style: TextStyle(
              //     fontSize: 16.0,
              //     color: Colors.white.withOpacity(0.5),
              //   ),
              // ),
              // const SizedBox(height: 24.0),
              // Card(
              //   margin:
              //       const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              //   color: Colors.black,
              //   child: ListTile(
              //     leading: Icon(
              //       Icons.email,
              //       color: Colors.white.withOpacity(0.7),
              //     ),
              //     title: Text(
              //       'asifullah@gmail.com',
              //       style: TextStyle(
              //         fontSize: 16.0,
              //         color: Colors.white.withOpacity(0.7),
              //       ),
              //     ),
              //   ),
              // ),
              // Card(
              //   color: Colors.black,
              //   margin:
              //       const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              //   child: ListTile(
              //     leading: Icon(
              //       Icons.phone,
              //       color: Colors.white.withOpacity(0.7),
              //     ),
              //     title: Text('+88 01799014170',
              //         style: TextStyle(
              //           fontSize: 16.0,
              //           color: Colors.white.withOpacity(0.7),
              //         )),
              //   ),
              // ),
              const SizedBox(height: 24.0),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                      children: [
                        Text(
                          'Skills',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 70,
                          child: Divider(
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8.0),
              Wrap(
                spacing: 20,
                runSpacing: 8.0,
                children: [
                  Chip(
                    label: Text(
                      'Flutter',
                      style: TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    backgroundColor: Colors.black,
                  ),
                  Chip(
                    label: Text(
                      'Data Analysis',
                      style: TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    backgroundColor: Colors.black,
                  ),
                  Chip(
                    label: Text(
                      'Java',
                      style: TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    backgroundColor: Colors.black,
                  ),
                  // Add more skills as needed
                ],
              ),
              const SizedBox(height: 24.0),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                      children: [
                        Text(
                          'Projects',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 90,
                          child: Divider(
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),

              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ProjectCard(
                          description:
                              "Get real-time weather updates",
                          link: "https://github.com/asif1919/weather_app",
                          title: "Weather App"),
                          SizedBox(width: 10,),
                      ProjectCard(
                          description:
                              "Ui",
                          link: "https://github.com/asif1919/shop_app_ecommerce",
                          title: "shop_app_ecommerce"),
                    ],
                  )),

              // const Wrap(
              //   spacing: 20,
              //   runSpacing: 8.0,
              //   children: [
              //     Chip(
              //       label: Text(
              //         'Calculator',
              //         style: TextStyle(
              //             fontSize: 14.5,
              //             fontWeight: FontWeight.bold,
              //             color: Colors.white),
              //       ),
              //       backgroundColor: Colors.blueGrey,
              //     ),
              //     Chip(
              //       label: Text(
              //         'Weather App',
              //         style: TextStyle(
              //             fontSize: 14.5,
              //             fontWeight: FontWeight.bold,
              //             color: Colors.white),
              //       ),
              //       backgroundColor: Colors.blueGrey,
              //     ),
              //     Chip(
              //       label: Text(
              //         'Quiz App',
              //         style: TextStyle(
              //             fontSize: 14.5,
              //             fontWeight: FontWeight.bold,
              //             color: Colors.white),
              //       ),
              //       backgroundColor: Colors.blueGrey,
              //     ),

              //     // Add more skills as needed
              //   ],
              // ),
              // Add your project details here
              // Example: ProjectCard(title: 'Project 1', description: 'Description 1'),
              Padding(
                padding: const EdgeInsets.only(right: 10, top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Text(
                        'Social Links ',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    SocialButton(),
                    const SizedBox(
                      width: 10,
                    ),
                    SocialButton(),
                    const SizedBox(
                      width: 10,
                    ),
                    SocialButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
