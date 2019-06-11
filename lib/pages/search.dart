import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie/pages/result.dart';

class Search extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Search();
  }
}

class _Search extends State<Search> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final Map<String, String> formValues = {
    'search': ''
  };

  @override
  Widget build(BuildContext context) {
    final String searchQuery = formValues['search'];
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(1),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (String value) {
                    setState(() {
                      formValues['search'] = value;
                    });
                  },
                  decoration: InputDecoration(hintText: 'Search')
                ),
              ),
            ),
            Expanded(
              child: Result(
                query: searchQuery,
              ),
            )
          ],
        ),
      )
    );
  }
}
