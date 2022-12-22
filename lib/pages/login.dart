import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  void dispose() {
    _email.dispose();
    _password.dispose();

    super.dispose();
  }

  var _visiblePassword;
  @override
  initState() {
    _visiblePassword = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Koperasi SM Sains Miri")),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            onChanged: () {
              Form.of(primaryFocus!.context!)!.save();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Masukkan alamat e-mel"),
                  validator: (String? value) {
                    return (value != null && !value.contains('@'))
                        ? 'Masukkan emel yang betul'
                        : null;
                  },
                  controller: _email,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Masukkan kata laluan"),
                  validator: (String? value) {
                    return (value == null)
                        ? 'Masukkan kata laluan yang betul'
                        : null;
                  },
                  obscureText: _visiblePassword,
                  controller: _password,
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        _visiblePassword = !_visiblePassword;
                      });
                    },
                    icon: Icon((_visiblePassword)
                        ? Icons.visibility_off
                        : Icons.visibility)),
                ElevatedButton(
                    onPressed: () {
                      logIn();
                      Navigator.pop(context);
                    },
                    child: Text('Log Masuk'))
              ],
            ),
          )),
    );
  }

  Future logIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text.trim(), password: _password.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
