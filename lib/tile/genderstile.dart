import 'package:app_modelos/screens/gendersscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GendersTile extends StatelessWidget {
  final DocumentSnapshot snapshot;

  GendersTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25.0,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(snapshot.data["image"]),
      ),
      title: Text(
        snapshot.data["name"],
      ),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => GendersScreen(snapshot),
          ),
        );
      },
    );
  }
}
