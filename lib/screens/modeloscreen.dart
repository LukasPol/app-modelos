import 'package:app_modelos/data/modelosdata.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class ModeloScreen extends StatefulWidget {
  final ModelosData modelo;

  ModeloScreen(this.modelo);
  @override
  _ModeloScreenState createState() => _ModeloScreenState(modelo);
}

class _ModeloScreenState extends State<ModeloScreen> {
  final ModelosData modelo;

  _ModeloScreenState(this.modelo);
  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: Text(modelo.name),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: .9,
            child: Carousel(
              images: modelo.images.map(
                (url) {
                  return NetworkImage(url);
                },
              ).toList(),
              dotSize: 4.0,
              dotSpacing: 15.0,
              dotBgColor: Colors.transparent,
              dotColor: primaryColor,
              autoplay: false,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  modelo.name,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Text(
                      modelo.voto.toString(),
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Text(
                  "Altura: ${modelo.height.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                ),
                const SizedBox(height: 20.0),
                Text(
                  "Descrição",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(modelo.descricao),
                const SizedBox(height: 20.0),
                RaisedButton(
                  onPressed: () {},
                  color: primaryColor,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(10.0),
                  child: Text("Contratar"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
