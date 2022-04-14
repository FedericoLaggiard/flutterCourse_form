import 'package:flutter/material.dart';
import 'package:login_stateful/mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
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
      validator: validateEmail,
      onSaved: (String? value) {
        print(value);
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
      validator: validatePassword,
      onSaved: (String? value) {
        print(value);
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
          FormState s = formKey.currentState as FormState;
          if(s.validate()) {
            s.save();
          }
        },
        child: const Text('Login')
    );
  }

}