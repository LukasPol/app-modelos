import 'package:cloud_firestore/cloud_firestore.dart';

class ModelosData {
  String gender;

  String id;
  String name;
  String descricao;
  double voto;
  double height;
  List images;

  ModelosData.fromDocument(DocumentSnapshot snapshot) {
    id = snapshot.documentID;
    name = snapshot.data["name"];
    descricao = snapshot.data["descricao"];
    voto = snapshot.data["voto"] + 0.0;
    height = snapshot.data["height"] + 0.0;
    images = snapshot.data["images"];
  }
}
