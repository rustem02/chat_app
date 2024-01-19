import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String receiverEmail;
  final String receiverID;
  const ChatPage({super.key, required this.receiverEmail, required this.receiverID});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverEmail),
      ),
    );
  }
}
