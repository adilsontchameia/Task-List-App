import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Iniciado lista vazia
  List _tarefas = [];
  //Carregar a lista na View
  void _carregarTarefas() {
    _tarefas = [];
    //Criado um laco de repeticao para encher a lista na view
    for (int i = 0; i <= 2; i++) {
      //Criacao de um Map de strings e dynamics
      Map<String, dynamic> itens = Map();
      itens["titulo"] = "Adilson $i";
      //Adicionando Item a lista
      _tarefas.add(itens);
    }
  }

  @override
  Widget build(BuildContext context) {
    //Iniciando a lista a iniciar o app
    _carregarTarefas();
    return Scaffold(
      //AppBar
      appBar: AppBar(
        title: Text("Task App"),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
            itemBuilder: (context, indice) {
              //Retorna numa listTitle
              return ListTile(
                title: Text(_tarefas[indice]["titulo"]),
              );
            },
            itemCount: _tarefas.length),
      ),
    );
  }
}
