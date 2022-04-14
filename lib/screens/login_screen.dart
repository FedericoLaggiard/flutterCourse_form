import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final GlobalKey formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 25.0)),
            submitButton(),
          ],
        )
      )
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (String? value) {
        // return null if valid or string message if invalid
        if(value == null || !value.contains('@')) return "Not a valid email address!";
      },
      decoration: const InputDecoration(
        labelText: 'E-mail:',
        hintText: 'you@example.com',
      ),
    );
  }

  Widget passwordField() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      validator: (String? value){
        if(value == null || value == "") return "Please insert the password";
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'Password:',
        hintText: 'your password',
      )
    );
  }

  Widget submitButton() {
    return ElevatedButton(
        onPressed: () {
          print((formKey.currentState as FormState).validate());
        },
        child: const Text('Login')
    );
  }

}