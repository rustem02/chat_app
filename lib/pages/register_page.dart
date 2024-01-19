import 'package:chat_app/styles/button.dart';
import 'package:chat_app/styles/text_field.dart';
import 'package:flutter/material.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>  {

  final emailContr = TextEditingController();
  final passContr = TextEditingController();
  final confPassContr = TextEditingController();

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
                  NewTextField(controller: confPassContr, obscure: true, hint: 'Подтвердить пароль'),
                  SizedBox(height: 20,),
                  NewButton(text: 'Регистрация', onTap: (){},),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Есть аккаунт?'),
                      SizedBox(width: 5,),
                      Text('Войти сейчас', style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  )
                ],
              ),
            ),
          ),
        )

    );
  }
  void Register(){

  }

}
