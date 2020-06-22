import 'package:app_modelos/models/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import './screens/myhome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Followers Modelos',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          primaryColor: Color.fromARGB(255, 4, 125, 141),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHome(),
      ),
    );
  }
}
