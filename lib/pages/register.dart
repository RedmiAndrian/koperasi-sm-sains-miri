import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:koop/firestore.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var _visiblePassword;
  List<String> _childList = new List<String>.filled(1, "", growable: true);
  var _shown = "1";
  var _items = ['1', '2', '3', '4', '5', '6', '7'];
  final _userName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _userName.dispose();
    _email.dispose();
    _password.dispose();

    super.dispose();
  }

  @override
  initState() {
    _childList = new List<String>.filled(1, "", growable: true);
    _visiblePassword = true;
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Jumlah anak jagaan: '),
                DropdownButton(
                  value: _shown,
                  items: _items.map((String items) {
                    return DropdownMenuItem(value: items, child: Text(items));
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _childList = new List<String>.filled(
                          int.parse('$value'), "",
                          growable: false);
                      _shown = '$value';
                    });
                  },
                ),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                      itemCount: int.parse(_shown),
                      itemBuilder: (BuildContext context, int index) {
                        return TextFormField(
                          validator: (String? value) {
                            return (value == null)
                                ? "Masukkan nama anak"
                                : null;
                          },
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(7.0),
                              border: OutlineInputBorder(),
                              hintText: 'Nama anak jagaan',
                              prefixIcon: Icon(Icons.person)),
                          onSaved: (String? value) {
                            _childList[index] = '$value';
                          },
                        );
                      }),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _userName,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Masukkan nama anda"),
                  validator: (String? value) {
                    return (value != null) ? 'Masukkan emel yang betul' : null;
                  },
                ),
                TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Masukkan alamat e-mel"),
                  validator: (String? value) {
                    return (value != null && !value.contains('@'))
                        ? 'Masukkan emel yang betul'
                        : null;
                  },
                ),
                TextFormField(
                  controller: _password,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Masukkan kata laluan"),
                  validator: (String? value) {
                    return (value == null) ? 'Masukkan kata laluan' : null;
                  },
                  obscureText: _visiblePassword,
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
                    onPressed: () async {
                      signUp().then((value) {
                        userSetup(_userName.text.trim(), _childList);
                      });
                      Navigator.pop(context);
                    },
                    child: Text('Daftar'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email.text.trim(), password: _password.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
