import 'package:chat_app/styles/button.dart';
import 'package:chat_app/styles/text_field.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>  {

  final emailContr = TextEditingController();
  final passContr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                SizedBox(height: 200,),
                NewTextField(controller: emailContr, obscure: false, hint: 'Email'),
                SizedBox(height: 20,),
                NewTextField(controller: passContr, obscure: true, hint: 'Password'),
                SizedBox(height: 20,),
                NewButton(text: 'Войти', onTap: (){},)
              ],
            ),
          ),
        ),
      )

    );
  }

}
