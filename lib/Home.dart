import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: AppBar(
        title: Text("Task App"),
        backgroundColor: Colors.orange,
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Pressionado");
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.orange,
        //elevation: 6, - Valor padrao da sombra
        //mini: true, - Tamanho mini
      ),
    );
  }
}
