import 'package:flutter/material.dart';
import 'dart:convert';

class ScannedPage extends StatefulWidget {
  ScannedPage({Key? key, required this.isSuccess}) : super(key: key);
  final bool isSuccess;
  @override
  State<ScannedPage> createState() => _ScannedPageState();
}

class _ScannedPageState extends State<ScannedPage> {
  @override
  Widget build(BuildContext context) {
    return widget.isSuccess == true
        ? const Scaffold(backgroundColor: Colors.green, body: Text("Succesful"))
        : const Scaffold(
            backgroundColor: Colors.red, body: Text("Unsuccesful"));
  }
}
