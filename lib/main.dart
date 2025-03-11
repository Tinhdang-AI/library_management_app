import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(LibraryManagementApp());
}

class LibraryManagementApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LibraryHomePage(),
    );
  }
}
