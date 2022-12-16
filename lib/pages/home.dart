import 'package:flutter/material.dart';
import 'package:koop/test_class/items.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    List<Items> items = List<Items>.filled(
        0, Items(name: "1", price: "1", type: "test"),
        growable: true);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        leading: GestureDetector(
          child: const Icon(Icons.menu),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              child: Icon(Icons.shopping_cart_outlined),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  color: Colors.lightBlueAccent,
                  child: Text(
                    "Stationeries",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  color: Colors.lightBlueAccent,
                  child: Text("Snacks", style: TextStyle(color: Colors.white)),
                ),
                Container(
                  color: Colors.lightBlueAccent,
                  child:
                      Text("Beverages", style: TextStyle(color: Colors.white)),
                ),
                Container(
                  color: Colors.lightBlueAccent,
                  child: Text("", style: TextStyle(color: Colors.white)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
