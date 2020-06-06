import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  TextEditingController controllerNome1 = new TextEditingController();
  TextEditingController controllerEndereco1 = new TextEditingController();
  TextEditingController controllerEspecialidade = new TextEditingController();
  
var _formkey = GlobalKey<FormState>();

  void usadd(){
    var url="http://192.168.0.16/seekhealth/us_add.php";

    http.post(url, body:{
      "us_nome": controllerNome1.text,
      "us_endereco": controllerEndereco1.text,
      "us_especialidade": controllerEspecialidade.text,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: new Text("Adicionar usuário",
        style: TextStyle(
        color: Colors.white),
        ),
        backgroundColor: Colors.blue[900],
        ),
        body: Form(
          child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/blueee.png"),
            fit: BoxFit.cover,
              ),
            ),
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: <Widget>[
                new ListTile(
                  leading: const Icon(Icons.person, color: Colors.black,),
                  title: new TextFormField(
                    controller: controllerNome1,
                    validator: (value){
                      if(value.isEmpty) return "Insira seu nome";
                    },
                    decoration: new InputDecoration(
                      hintText: "Nome", labelText: "Nome",
                    ),
                ),
                ),
                new ListTile(
                  leading: const Icon(Icons.home, color: Colors.black,),
                  title: new TextFormField(
                    controller: controllerEndereco1,
                    validator: (value){
                      if(value.isEmpty) return "Insira seu endereço";
                    },
                    decoration: new InputDecoration(
                      hintText: "Endereço", labelText: "Endereço",
                    ),
                ),
                ),
                new ListTile(
                  leading: const Icon(Icons.person, color: Colors.black,),
                  title: new TextFormField(
                    controller: controllerEspecialidade,
                    validator: (value){
                      if(value.isEmpty) return "Insere usuario";
                    },
                    decoration: new InputDecoration(
                      hintText: "Usuario", labelText: "Usuario",
                    ),
                ),
                ),
                const Divider(
                    height: 1.0,
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(70, 16, 70, 2),
                      child: RaisedButton(
                      child: Text(
                        "SALVAR",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      color: Colors.blue[900],
                      padding: EdgeInsets.fromLTRB(50, 16, 50, 16),
                      onPressed: (){
                        usadd();
                        Navigator.pushNamed(context, "/listaUs");
                      },
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                    ),
                    ),
              
                  Padding(
                      padding: EdgeInsets.fromLTRB(70, 16, 70, 2),
                      child: RaisedButton(
                      child: Text(
                        "SAIR",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      color: Colors.red[900],
                      padding: EdgeInsets.fromLTRB(50, 16, 50, 16),
                      onPressed: (){
                        Navigator.pushNamed(context, "/login");
                      },
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                    ),
                    ),
                  // new RaisedButton(
                  //   child: new Text("Sair"),
                  //   color: Colors.red,
                  //   shape: new RoundedRectangleBorder(
                  //     borderRadius: new BorderRadius.circular(30.0)
                  //   ),
                  //   onPressed:(){
                  //     Navigator.pushReplacementNamed(context, '/');
                  //   },
                  // )
              ],
            )
          ),
        ),
        ),
    );
  }
}