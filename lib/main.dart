// import 'dart:js';

import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/services/application.dart';
import 'package:chat_app/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/login_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider(
    create: (context) => Auth(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Application(),
    );
  }
  
}
