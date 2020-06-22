import 'package:flutter/material.dart';
import 'package:app_modelos/components/hometab.dart';
import 'package:app_modelos/components/customdrawer.dart';
import 'package:app_modelos/components/modelostab.dart';

class MyHome extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          drawer: CustomDrawer(_pageController),
          body: HomeTab(),
        ),
        Scaffold(
          appBar: AppBar(
            title: const Text("Generos"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: ModelosTab(),
        ),
        Container(color: Colors.yellow),
        Container(color: Colors.green),
      ],
    );
  }
}
