import 'package:app_modelos/tile/modelotile.dart';
import 'package:app_modelos/data/modelosdata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GendersScreen extends StatelessWidget {
  final DocumentSnapshot snapshot;

  GendersScreen(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(snapshot.data['name']),
          centerTitle: true,
        ),
        body: FutureBuilder<QuerySnapshot>(
          future: Firestore.instance
              .collection("modelos")
              .document(snapshot.documentID)
              .collection("modelo")
              .orderBy("voto", descending: true)
              .getDocuments(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Container(
                child: GridView.builder(
                  padding: EdgeInsets.all(4.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    childAspectRatio: 0.65,
                  ),
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    return ModeloTile(
                      ModelosData.fromDocument(
                        snapshot.data.documents[index],
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
