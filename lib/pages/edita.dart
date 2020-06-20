import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
  TextEditingController controllerEndereco ;
  TextEditingController controllerUsuario;
  TextEditingController controllerDtNasc;

  void edit(){
    http.post("http://192.168.0.16/seekhealth/edit.php", body:{
      "idUsuario": widget.list[widget.index]['idUsuario'],
      "nome": controllerNome.text,
      "senha": controllerSenha.text,
      "email": controllerEmail.text,
      "endereco": controllerEndereco.text,
      "usuario": controllerUsuario.text,
      "dt_nasc": controllerDtNasc.text,
    });
  }

  @override
  void initState(){
    controllerNome=new TextEditingController(text: widget.list[widget.index]['nome']);
    controllerSenha=new TextEditingController(text: widget.list[widget.index]['senha']);
    controllerEmail=new TextEditingController(text: widget.list[widget.index]['email']);
    controllerEndereco=new TextEditingController(text: widget.list[widget.index]['endereco']);
    controllerUsuario=new TextEditingController(text: widget.list[widget.index]['usuario']);
    controllerDtNasc=new TextEditingController(text: widget.list[widget.index]['dt_nasc']);
    super.initState();
  }
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: new Text("Editar",
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
                    obscureText: true,
                    validator: (value){
                      if(value.isEmpty) return "Confirme sua senha";
                    },
                    decoration: new InputDecoration(
                      hintText: "Senha", labelText: "Senha",
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
                  new ListTile(
                  leading: const Icon(Icons.home, color: Colors.black,),
                  title: new TextFormField(
                    controller: controllerEndereco,
                    validator: (value){
                      if(value.isEmpty) return "Confirme seu Endereço";
                    },
                    decoration: new InputDecoration(
                      hintText: "Endereço", labelText: "Endereço",
                    ),
                  ),
                  ),
                  new ListTile(
                  leading: const Icon(Icons.person_add, color: Colors.black,),
                  title: new TextFormField(
                    controller: controllerUsuario,
                    validator: (value){
                      if(value.isEmpty) return "Confirme seu Usuario";
                    },
                    decoration: new InputDecoration(
                      hintText: "Usuario", labelText: "Usuario",
                    ),
                  ),
                  ),
                  new ListTile(
                  leading: const Icon(Icons.person_add, color: Colors.black,),
                  title: new TextFormField(
                    controller: controllerDtNasc,
                    validator: (value){
                      if(value.isEmpty) return "Confirme sua data de nascimento";
                    },
                    decoration: new InputDecoration(
                      hintText: "Data de Nascimento", labelText: "Data Nascimento",
                    ),
                  ),
                  ),
                  const Divider(
                    height: 1.0,
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(10.0),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(70, 16, 70, 2),
                    child: RaisedButton(
                      child: Text(
                        "Salvar",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      color: Colors.blue[900],
                      padding: EdgeInsets.fromLTRB(70, 16, 70, 16),
                      onPressed: (){
                            edit();
                           Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (BuildContext context)=>new ListaUser()
                        ),
                           );
                      },
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                    ),
                  ),
              ],
            )
          ],
        )
      )
      )
    );
  }
}