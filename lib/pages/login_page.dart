import 'package:chat_app/pages/register_page.dart';
import 'package:chat_app/styles/button.dart';
import 'package:chat_app/styles/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth.dart';


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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30,),
                NewTextField(controller: emailContr, obscure: false, hint: 'Эл. почта'),
                SizedBox(height: 20,),
                NewTextField(controller: passContr, obscure: true, hint: 'Пароль'),
                SizedBox(height: 20,),
                NewButton(text: 'Войти', onTap: (){Login();},),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Нет аккаунта?'),
                    SizedBox(width: 5,),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                      },
                      child: Text(
                        'Зарегистрироваться сейчас',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )


                  ],
                )
              ],
            ),
          ),
        ),
      )

    );
  }

  void Login() async{
    final auth = Provider.of<Auth>(context, listen: false);

    try{
      await auth.login(emailContr.text, passContr.text);
    }
    catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(
          e.toString()
        ))
      );
    }
  }

}
