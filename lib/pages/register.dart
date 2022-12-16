import 'package:flutter/material.dart';

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
  var _password;
  var _email;

  @override
  initState() {
    _childList = new List<String>.filled(1, "", growable: true);
    _password = "";
    _email = "";
    _visiblePassword = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Koperasi SM Sains Miri")
      ),
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
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items)
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _childList = new List<String>.filled(int.parse('$value'), "", growable: false);
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
                        return (value == null) ? "Masukkan nama anak" : null;
                      },
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(7.0),
                        border: OutlineInputBorder(),
                        hintText: 'Nama anak jagaan',
                        prefixIcon: Icon(Icons.person)
                      ),
                      onSaved: (String? value) {
                        _childList[index] = '$value';
                      },
                    );
                  }
              ),
            ),
            SizedBox(height:20),
            TextFormField(
              onSaved: (String? value) {
                _email = '$value';
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Masukkan alamat e-mel"),
              validator: (String? value) {
                return (value != null && !value.contains('@'))
                    ? 'Masukkan emel yang betul'
                    : null;
              },
            ),
            TextFormField(
              onSaved: (String? value) {
                _password = '$value';
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Masukkan kata laluan"),
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
                icon: Icon(
                    (_visiblePassword) ? Icons.visibility_off : Icons.visibility)),
            ElevatedButton(
                onPressed: () {
                  print("$_childList, $_email, $_password");
                },
                child: Text('Daftar'))
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
