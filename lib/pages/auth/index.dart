import 'package:flutter/material.dart';

import 'signUp.dart';

class AuthIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auth'),
      ),
      body: SignUp(),
    );
  }
}