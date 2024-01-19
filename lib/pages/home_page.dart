// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth.dart';
import 'chat_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Чаты'),
        actions: [
          IconButton(onPressed: signOut, icon: const Icon(Icons.logout))
        ],
      ),
      body: _userList(),
    );
  }

  Widget _userList(){
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot){
          if(snapshot.hasError){
            return const Text('Ошибка данных');
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(color: Colors.purpleAccent,backgroundColor: Colors.white));
          }
          return ListView(
            children: snapshot.data!.docs.map<Widget>((doc) => _userListItem(doc)).toList(),
          );
        }
    );
  }

  Widget _userListItem(DocumentSnapshot documentSnapshot){

    Map<String, dynamic> data = documentSnapshot.data()! as Map<String, dynamic>;

    if(_firebaseAuth.currentUser!.email != data['email']){
    return ListTile(
      title: Text(data['email']),
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatPage(receiverEmail: data['email'], receiverID: data['uid'],)),
        );
      },
    );
    } else{
      return Container();
    }
  }
  void signOut(){
    final authService = Provider.of<Auth>(context, listen: false);
    authService.signOut();
  }
}
