import 'package:flutter/material.dart';

class SettingsIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Container(
        padding: EdgeInsets.all(8.0), // Adjust padding as needed
        child: Icon(Icons.settings, size: 30), // Customize the size as needed
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/settings');
      },
    );
  }
}
