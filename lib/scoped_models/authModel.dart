import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

mixin Auth on Model {
  final String url = 'https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=';
  final String apiKey = 'AIzaSyC-9Nf4rnDLnc7Iv8JiUbNUmwS8HrpPT34';
  bool isLoading = false;

  Future<Map<String, dynamic>> signUp (Map<String, String> authData) async {
    isLoading = true;
    notifyListeners();
    String message;
    bool hasError;
    final Map<String, dynamic> _authData = {
      'email': authData['email'],
      'password': authData['password'],
      'returnSecureToken': true
    };
    final http.Response response = await http.post(
      "$url$apiKey", 
      body: json.encode(_authData),
      headers: {
        'Content-Type': 'application/json'
      }
    );
    final Map<String, dynamic> responseData = json.decode(response.body);
    if (responseData['error'] != null) {
      message = responseData['error']['message'];
      hasError = true;
    } else {
      message = 'Success';
      hasError = false;
      final SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('token', responseData['idToken']);
    }
    isLoading = false;
    notifyListeners();
    return {
      'success': true, 
      'message': message,
      'error': hasError
    };
  }
}