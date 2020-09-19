import 'package:email_sender/models/email.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _text = '';
  var email = Email('seu_email', 'sua_senha');

  void _sendEmail() async {
    bool result = await email.sendMessage(
      'Corpo do email',
      'Email de destino', 
      'Assunto do email'
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
