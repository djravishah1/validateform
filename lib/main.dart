import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(),
      home: new FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _submit() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();

      performLogin();
    }
  }

  void performLogin() {
    final snackbar = new SnackBar(
      content: new Text("Email : $_email, password: $_password"),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: scaffoldKey,
        appBar: new AppBar(
          title: new Text('Form Page'),
        ),
        body: new Padding(
          padding: const EdgeInsets.all(20.0),
          child: new Form(
            key: formKey,
            child: new Column(
              children: [
                new TextFormField(
                  decoration: new InputDecoration(labelText: "Email"),
                  validator: (value) =>
                      !value.contains("@") ? "Invalid Email" : null,
                  onSaved: (newValue) => _email = newValue,
                ),
                new TextFormField(
                  decoration: new InputDecoration(labelText: "Password"),
                  validator: (value) =>
                      value.length < 6 ? 'Password to short' : null,
                  onSaved: (newValue) => _password = newValue,
                  obscureText: true,
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 20),
                ),
                new RaisedButton(
                  child: new Text("login"),
                  onPressed: _submit,
                )
              ],
            ),
          ),
        ));
  }
}
