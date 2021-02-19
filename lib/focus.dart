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
  final FocusNode focusNode = new FocusNode();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Form Page'),
      ),
      body: new Container(
          padding: const EdgeInsets.all(10),
          child: new Column(
            children: <Widget>[
              new TextField(
                autofocus: true,
              ),
              new TextField(
                focusNode: focusNode,
              ),
            ],
          )),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: () => FocusScope.of(context).requestFocus(focusNode),
      ),
    );
  }
}
