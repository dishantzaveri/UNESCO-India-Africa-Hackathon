import 'package:flutter/material.dart';

import 'background/background.dart';
import 'forms/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children:  const [
              Background(),  LoginForm() ,
          ],
        ),
      );
  }
}