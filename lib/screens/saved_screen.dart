import 'package:flutter/material.dart';

class SavedScreen extends StatefulWidget{
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('this is appbar in Saved Screen'),
      ),
      body: const Center(
        child: Text('This is Saved Screen'),
      ),

    );
  }
}