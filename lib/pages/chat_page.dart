import 'package:chat_app/services/chat_services.dart';
import 'package:chat_app/styles/text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String receiverEmail;
  final String receiverID;
  const ChatPage({super.key, required this.receiverEmail, required this.receiverID});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessage() async{
    if(_messageController.text.isNotEmpty){
      await _chatService.sendMessage(widget.receiverID, _messageController.text);
      _messageController.clear();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverEmail),
      ),
      body: Column(
        children: [
          Expanded(child: _messageList(),
          ),
          _messageInput(),
        ],
      ),
    );
  }

  Widget _messageInput(){
    return Row(
      children: [
        Expanded(child: NewTextField(controller: _messageController, obscure: false, hint: 'Сообщение',)),

        IconButton(onPressed: sendMessage,
            icon: const Icon(Icons.arrow_circle_up, size: 40,))

      ],
    );
  }

  Widget _messageItem(DocumentSnapshot documentSnapshot){
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
    var alignment = (data['senderId'] == _firebaseAuth.currentUser!.uid) ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Column(
        children: [
          // Text(data['senderEmail']),
          SizedBox(height: 10,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(data['message'],),
          ),

          SizedBox(height: 10,),
        ],
      ),
    );
  }

  Widget _messageList(){
    return StreamBuilder(stream: _chatService.getMessages(widget.receiverID, _firebaseAuth.currentUser!.uid),
        builder: (context, snapshot){
      if(snapshot.hasError){
        return Text('Ошибка${snapshot.error}');
      }
      if(snapshot.connectionState == ConnectionState.waiting){
        return const Center(child: CircularProgressIndicator(color: Colors.purpleAccent,backgroundColor: Colors.white));
      }

      return ListView(
        children: snapshot.data!.docs.map((documentSnapshot) => _messageItem(documentSnapshot)).toList(),
      );

        });
  }
}
