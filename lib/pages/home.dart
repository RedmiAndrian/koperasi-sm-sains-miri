import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:koop/pages/login.dart';
import 'package:koop/pages/newUserPage.dart';
import 'package:koop/test_class/items.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("An Error Has Occured"));
          } else if (snapshot.hasData) {
            return HomePage();
          } else {
            return NewUserPage();
          }
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: const Text('Nanti Tambah'),
            ),
            ListTile(
              trailing: const Icon(Icons.logout),
              title: const Text("Log Out"),
              onTap: () => FirebaseAuth.instance.signOut(),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Home'),
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
          children: [
            SizedBox(
              height: 40,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    color: Colors.lightBlueAccent,
                    child: Text(
                      "Stationeries",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    color: Colors.lightBlueAccent,
                    child:
                        Text("Snacks", style: TextStyle(color: Colors.white)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    color: Colors.lightBlueAccent,
                    child: Text("Beverages",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    color: Colors.lightBlueAccent,
                    child:
                        Text("Services", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
