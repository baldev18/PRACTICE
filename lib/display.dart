import 'package:flutter/material.dart';

class DisplayScreen extends StatefulWidget {
  final String username;

  const DisplayScreen({super.key, required this.username});

  @override
  State<DisplayScreen> createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Display"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Text(
          "Welcome ${widget.username}",
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}