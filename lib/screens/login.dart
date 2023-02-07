import 'package:e_commerce/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:styled_widget/styled_widget.dart';

import '../api/requests.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (input) {
                  if (input!.isEmpty) {
                    return 'Por favor, insira um email';
                  }
                  if (!EmailValidator.validate(input)) {
                    return "Por favor, insira um email válido";
                  }
                },
                onSaved: (input) => _email = input!,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (input) {
                  if (input!.length < 6) {
                    return 'A senha deve ter pelo menos 6 caracteres';
                  }
                },
                onSaved: (input) => _password = input!,
                decoration: const InputDecoration(labelText: 'Senha'),
                obscureText: true,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  UserLogin.fetchUserLogin({
                    'email': _email,
                    'password': _password,
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(
                        key: Key('homeScreen'),
                      ),
                    ),
                  );
                }
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ).width(400).alignment(Alignment.center),
    );
  }
}
