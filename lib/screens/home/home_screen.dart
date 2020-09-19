import 'package:email_sender/models/email.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _text = '';
  var email = Email('felipe.bufelli@gmail.com', '9874febufelli');

  void _sendEmail() async {
    bool result = await email.sendMessage(
      'Se você ta lendo isso, consegui enviar e-mail pelo app rsrs',
      'isadoracezarino@gmail.com', 
      'URGENTE'
    );

    setState(() {
      _text = result ? 'Enviado.' : 'Não enviado.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _sendEmail,
        tooltip: 'Send Email',
        child: Icon(Icons.email),
      ),
      body: Center(
        child: Text(_text),
      ),
    );
  }
}
