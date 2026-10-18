import 'package:flutter/material.dart';

class DetailPaperScreen extends StatefulWidget{
  const DetailPaperScreen({super.key});

  @override
  State<DetailPaperScreen> createState() => _DetailPaperScreenState();
}

class _DetailPaperScreenState extends State<DetailPaperScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('this is appbar in Detail Paper'),
      ),
      body: const Center(
        child: Text('This is Detail Paper Screen'),
      ),

    );
  }
}