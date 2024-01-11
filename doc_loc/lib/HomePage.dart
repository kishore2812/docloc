// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'HomeIcon.dart';
import 'SettingsIcon.dart';
import 'CameraIcon.dart';
import 'HelpIcon.dart';

class HomePage extends StatelessWidget {
  final User? user;

  HomePage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome ${user?.displayName ?? "User"}!'),

            // Example: Sign out button
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                print("User signed out");

                // Navigate back to the sign-in screen
                Navigator.pushReplacementNamed(context, '/signin');
              },
              child: Text('Sign out'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            HomeIcon(),
            SettingsIcon(),
            IconButton(
              icon: Icon(Icons.qr_code),
              onPressed: () {
                // Navigate to the QR scanner or perform the QR scanning action
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      body: Center(
                        child: SizedBox(
                          width: 300.0, // Adjust the width as needed
                          height: 300.0, // Adjust the height as needed
                          child: QRView(
                            key: GlobalKey(debugLabel: 'QR'),
                            onQRViewCreated: (controller) {},
                            cameraFacing: CameraFacing.back,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            CameraIcon(),
            HelpIcon(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
