import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:seekhealth/pages/ListaUsuario.dart';

class Edit extends StatefulWidget {
  final List list;
  final int index;
  Edit({this.list, this.index});
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  TextEditingController controllerNome;
  TextEditingController controllerSenha;
  TextEditingController controllerEmail;

  void edit(){
    var url="http://192.168.0.16/seekhealth/edit.php";
    http.post(url, body:{
      "idUsuario": widget.list[widget.index]['idUsuario'],
      "nome": controllerNome.text,
      "senha": controllerSenha.text,
      "email": controllerEmail.text,
    });

  }

  @override
  void initState(){
    controllerNome=new TextEditingController(text: widget.list[widget.index]['nome']);
    controllerSenha=new TextEditingController(text: widget.list[widget.index]['senha']);
    controllerEmail=new TextEditingController(text: widget.list[widget.index]['email']);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: new Text("Editar"),
      // ),
      
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            new Column(
              children: <Widget>[
                new ListTile(
                  leading: const Icon(Icons.person, color: Colors.black,),
                  title: new TextFormField(
                    controller: controllerNome,
                    validator: (value){
                      if(value.isEmpty)return "Insira um usuario";
                    },
                    decoration: new InputDecoration(
                      hintText: "Usuario", labelText: "Usuario",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.vpn_key, color: Colors.black,),
                  title: new TextFormField(
                    controller: controllerSenha,
                    validator: (value){
                      if(value.isEmpty) return "Confirme sua senha";
                    },
                    decoration: new InputDecoration(
                      hintText: "Contra senha", labelText: "Contra senha",
                    ),
                  ),
                  ),
                  new ListTile(
                  leading: const Icon(Icons.alternate_email, color: Colors.black,),
                  title: new TextFormField(
                    controller: controllerEmail,
                    validator: (value){
                      if(value.isEmpty) return "Confirme seu Email";
                    },
                    decoration: new InputDecoration(
                      hintText: "Email", labelText: "Email",
                    ),
                  ),
                  ),
                  const Divider(
                    height: 1.0,
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(10.0),
                  ),
                  new RaisedButton(
                    child: new Text("Salvar"),
                    color: Colors.black,
                    onPressed:(){
                      edit();
                      Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (BuildContext context)=>new ListaUser()
                      )
                      );
                    },
                  )
              ],
            )
          ],
        )
      )
      );
  }
}