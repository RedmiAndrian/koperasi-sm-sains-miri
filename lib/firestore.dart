import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';

Future<void> userSetup(String displayName, List<String> _childlist) async {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid.toString();

  final data = <String, dynamic>{
    "displayName": displayName,
    "childList": _childlist,
    "wishlist": []
  };

  users.doc(auth.currentUser!.uid.toString()).set(data);
  return;
}
