import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("Daftar Produk Baharu", style: TextStyle(fontSize: 20)),
        const SizedBox(height: 15),
        const TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(), hintText: "Nama Produk"),
        ),
        const TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(), hintText: 'Harga Produk'),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 10),
        ElevatedButton(
            onPressed: () {
              print("yadyadya");
            },
            child: Text('Daftar Produk Baharu'))
      ],
    );
  }
}
