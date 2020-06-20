import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  TextEditingController controllerNome = new TextEditingController();
  TextEditingController controllerSenha = new TextEditingController();
  TextEditingController controllerEmail = new TextEditingController();
  TextEditingController controllerEndereco = new TextEditingController();
  TextEditingController controllerUsuario = new TextEditingController();
  TextEditingController controllerDtNasc = new TextEditingController();

  var _formKey = GlobalKey<FormState>();

  void add() {
    var url = "http://192.168.0.16/seekhealth/add.php";

    http.post(url, body: {
      "nome": controllerNome.text,
      "senha": controllerSenha.text,
      "email": controllerEmail.text,
      "endereco": controllerEndereco.text,
      "usuario": controllerUsuario.text,
      "dt_nasc": controllerDtNasc.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: new Text(
          "Adicionar usuário",
          style: TextStyle(color: Colors.white),
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
          key: _formKey,
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                children: <Widget>[
                  new ListTile(
                    leading: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    title: new TextFormField(
                      controller: controllerNome,
                      validator: (value) {
                        if (value.isEmpty) return "Insira seu nome";
                      },
                      decoration: new InputDecoration(
                        hintText: "Nome",
                        labelText: "Nome",
                      ),
                    ),
                  ),

                  new ListTile(
                    leading: const Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    title: new TextFormField(
                      controller: controllerEmail,
                      validator: (value) {
                        if (value.isEmpty) return "Insira um Email";
                      },
                      decoration: new InputDecoration(
                        hintText: "Email",
                        labelText: "Email",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(
                      Icons.vpn_key,
                      color: Colors.black,
                    ),
                    title: new TextFormField(
                      controller: controllerSenha,
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) return "Insira uma senha";
                      },
                      decoration: new InputDecoration(
                        hintText: "Senha",
                        labelText: "Senha",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(
                      Icons.home,
                      color: Colors.black,
                    ),
                    title: new TextFormField(
                      controller: controllerEndereco,
                      validator: (value) {
                        if (value.isEmpty) return "Insira seu endereço";
                      },
                      decoration: new InputDecoration(
                        hintText: "Endereço",
                        labelText: "Endereço",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    title: new TextFormField(
                      controller: controllerDtNasc,
                      validator: (value) {
                        if (value.isEmpty)
                          return "Insere sua data de nascimento";
                      },
                      decoration: new InputDecoration(
                        hintText: "Data de Nascimento",
                        labelText: "Data de Nascimento",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    title: new TextFormField(
                      controller: controllerUsuario,
                      validator: (value) {
                        if (value.isEmpty) return "Insere usuario";
                      },
                      decoration: new InputDecoration(
                        hintText: "Usuario",
                        labelText: "Usuario",
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
                        onPressed: () {
                          add();
                          Navigator.pushNamed(context, "/login");
                        },
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0))),
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
                        onPressed: () {
                          Navigator.pushNamed(context, "/login");
                        },
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0))),
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
              )),
        ),
      ),
    );
  }
}
