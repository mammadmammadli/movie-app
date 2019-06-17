import 'package:flutter/material.dart';
import 'package:movie/scoped_models/state.dart';
import 'package:scoped_model/scoped_model.dart';

import 'signUpForm.dart';

class SignUp extends StatelessWidget {

  void _onSubmit(Function signUp, Map<String, dynamic> authData) async {
    Map<String, dynamic> responseInfo = await signUp(authData);
    print(responseInfo);
  }
  
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, StateModel model) {
        return Scaffold(
          body: Center(
            child: SignUpForm(
              onSubmit: (Map<String, dynamic> authData) {
                this._onSubmit(model.signUp, authData);
              },
              isLoading: model.isLoading,
            ),
          ),
        );
      }
    );
  }
}
