import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final bool isLoading;
  final Map<String, String> authData = {};
  final Function onSubmit;

  SignUpForm({this.onSubmit, this.isLoading});

  void _onSubmit() {
    _formKey.currentState.save();
    this.onSubmit(this.authData);
  }

  final List<Widget> _children = [
    Padding(
      padding: EdgeInsets.only(
        right: 10
      ),
      child: Text('Sign up')
    )
  ];

  @override
  Widget build(BuildContext context) {
    if (this.isLoading) {
      _children.add(
        CircularProgressIndicator(
          strokeWidth: 1, 
        )
      );
    }

    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: 'Email'),
              onSaved: (String email) {
                authData['email'] = email;
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 0),
              child: TextFormField(
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(labelText: 'Password'),
                onSaved: (String password) {
                  authData['password'] = password;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: RaisedButton(
                padding: EdgeInsets.only(
                  top: 10,
                  bottom: 10
                ),
                onPressed: _onSubmit,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _children,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
