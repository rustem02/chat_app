import 'package:chat_app/styles/button.dart';
import 'package:chat_app/styles/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth.dart';
import 'login_page.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>  {

  final firstName = TextEditingController();
  final lastName = TextEditingController();
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
                  NewTextField(controller: firstName, obscure: false, hint: 'Имя'),
                  SizedBox(height: 30,),
                  NewTextField(controller: lastName, obscure: false, hint: 'Фамилия'),
                  SizedBox(height: 30,),
                  NewTextField(controller: emailContr, obscure: false, hint: 'Эл. почта'),
                  SizedBox(height: 20,),
                  NewTextField(controller: passContr, obscure: true, hint: 'Пароль'),
                  SizedBox(height: 20,),
                  NewTextField(controller: confPassContr, obscure: true, hint: 'Подтвердить пароль'),
                  SizedBox(height: 20,),
                  NewButton(text: 'Регистрация', onTap: (){Register();},),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Есть аккаунт?'),
                      SizedBox(width: 5,),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: Text('Войти сейчас', style: TextStyle(fontWeight: FontWeight.bold),),
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
  void Register() async{
  if(passContr.text != confPassContr.text){
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                'Пароли не совпадают!'
            ),
        ),
    );
    return;
  }
  final auth = Provider.of<Auth>(context, listen: false);

  try{
    await auth.register(emailContr.text, passContr.text);
  }
  catch(e){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(e.toString()))
    );
  }
  }

}
