import 'package:flutter/material.dart';

class HomeIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Container(
        padding: EdgeInsets.all(8.0), // Adjust padding as needed
        child: Icon(Icons.home, size: 30), // Customize the size as needed
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/home');
      },
    );
  }
}
