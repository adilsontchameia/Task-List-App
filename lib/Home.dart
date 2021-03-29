import 'package:flutter/material.dart';
//Importando o path privider
import 'package:path_provider/path_provider.dart';
//Processamento dentro do dispositivo do usuario
import 'dart:io';
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Iniciado lista estatica
  //List _tarefas = ["Estudar Flutter", "Estudar Node.js", "Estudar Java"];
  List _tarefas = [];
  //Metodos para salvar, nos sistemas de arquivos
  //Os caminhos para salvar no ios ou android, o caminho e diferente
  //Iremos usar uma biblioteca(pluguin) que definira isso automaticamente(PathProvider);
  //Esse metodo de salvamento nao e o SQLFLITE
  //Tem que ser ansicrona, porque nao se sabe quanto demorara para efetuar a consulta

  TextEditingController _controllerTarefa = TextEditingController();
  //Metodo para nos retornar o File
  //Vai ser retornado no futuro
  Future<File> _getFile() async {
    //Local que queremos salvar, recuperar, remover
    final diretorio = await getApplicationDocumentsDirectory();
    //Definir o nome do diretorio
    return File("${diretorio.path}/dados.json");
  }

//Salvar tarefa pelo alert
  _salvarTarefa() {
    String textoDigitado = _controllerTarefa.text;
    //Criando os Dados
    Map<String, dynamic> tarefa = Map();
    tarefa["titulo"] = textoDigitado;
    //Booleano para verificarmos se concluimos
    tarefa["realizada"] = false;
    //Atualizar a lista de tarefas
    setState(() {
      _tarefas.add(tarefa);
    });
    _salvarArquivos();
    _controllerTarefa.text = "";
  }

  _salvarArquivos() async {
    //Local que queremos salvar
    var arquivo = await _getFile();
    //Convertendo a lista em json
    String dados = json.encode(_tarefas);
    //Definir o que salvar
    arquivo.writeAsString(dados);
    print("Caminho: " + dados);
  }

  _lerArquivos() async {
    try {
      //Recuperando o diretorio
      final arquivo = await _getFile();
      return arquivo.readAsString();
    } catch (e) {
      e.toString();
      print(e);
    }
  }

  //Iniciar a leitura antes de iniciar propriamente o app
  @override
  void initState() {
    super.initState();
    _lerArquivos().then((dados) {
      //Configurar a lista
      setState(() {
        _tarefas = json.decode(dados);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //Iniciando a lista a iniciar o app
    //_salvarArquivos();
    print("Itens Salvos: " + _tarefas.toString());
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
                  //Pegar o que foi digitado
                  controller: _controllerTarefa,
                  decoration: InputDecoration(labelText: "Digite uma tarefa"),
                  onChanged: (text) {},
                ),
                //Acao
                actions: [
                  TextButton(
                    //Fechar o alertDialog
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "Cancela",
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _salvarTarefa();
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Salvar",
                      style: TextStyle(color: Colors.orange),
                    ),
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
                      title: Text(_tarefas[index]["titulo"]),
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
