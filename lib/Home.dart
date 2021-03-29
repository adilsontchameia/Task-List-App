import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Iniciado lista estatica
  List _tarefas = ["Estudar Flutter", "Estudar Node.js", "Estudar Java"];

  @override
  Widget build(BuildContext context) {
    //Iniciando a lista a iniciar o app
    //_carregarTarefas();
    return Scaffold(
      //AppBar
      appBar: AppBar(
        title: Text("Task App"),
        backgroundColor: Colors.orange,
      ),
      //FloatingActionButton
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.orange,
        onPressed: () {
          //Retornar um alertDialog
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                //Titulo
                title: Text("Adicionar Tarefa"),
                //Mostrar um textField
                content: TextField(
                  decoration: InputDecoration(labelText: "Digite uma tarefa"),
                  onChanged: (text) {},
                ),
                //Acao
                actions: [
                  TextButton(
                    onPressed: () {},
                    child: Text("Cancela"),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("Salvar"),
                  ),
                ],
              );
            },
          );
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    //Retorna numa listTitle
                    return ListTile(
                      title: Text(_tarefas[index]),
                    );
                  },
                  itemCount: _tarefas.length),
            ),
          ),
        ],
      ),
    );
  }
}
