import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialButton extends StatelessWidget {

  

 
  final Uri _url = Uri.parse('https://www.facebook.com/');
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _launchUrl(); // Corrected: Added parentheses
      },
      child: IconButton(
        icon: Icon(Icons.facebook),
        iconSize: 40,
        color: Colors.white, // Change the color to match your app's theme
        onPressed: () {
          _launchUrl(); // Corrected: Added parentheses
        },
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launch(_url.toString())) {
      throw Exception('Could not launch $_url');
    }
  }
}
