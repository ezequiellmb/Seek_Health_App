import 'package:flutter/material.dart';
import 'package:seekhealth/pages/Adm.dart';
import 'package:seekhealth/pages/Detail.dart';

class Adm extends StatefulWidget {
  @override
  _AdmState createState() => _AdmState();
}

class _AdmState extends State<Adm> {
  TextEditingController _controllerRSenha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text("ADMINISTRADOR"),
        backgroundColor: Colors.indigo[900],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            new UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/seek2.png'))),
              accountEmail: new Text("admin@gmail.com",
                  style: TextStyle(color: Colors.black, fontSize: 14)),
              accountName: new Text("Administrador 01",
                  style: TextStyle(color: Colors.black, fontSize: 17)),
              currentAccountPicture: new GestureDetector(
                child: new CircleAvatar(
                  radius: 2000,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/dcc.png"),
                ),
                onTap: () => print("This is your current account."),
              ),
            ),
            
            ListTile(
              leading: Icon(Icons.input, color: Colors.black,size: 25),
              title: Text('Home', style: TextStyle(color: Colors.black,fontSize: 17)),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.verified_user, color: Colors.black,size: 25),
              title: Text('Profile', style: TextStyle(color: Colors.black,fontSize: 17)),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.map, color: Colors.black, size: 25),
              title: Text('Mapa', style: TextStyle(color: Colors.black,fontSize: 17)),
              onTap: () => {Navigator.pushNamed(context, '/mapaaa')},
            ),
            ListTile(
              leading: Icon(Icons.border_color, color: Colors.black,size: 25),
              title: Text('Feedback', style: TextStyle(color: Colors.black,fontSize: 17)),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.black,size: 25),
              title: Text('Logout', style: TextStyle(color: Colors.black,fontSize: 17)),
              onTap: () => {Navigator.pushNamed(context, '/login')},
            ),
            Divider(
              height: 150,
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.black,size: 25),
              title: Text('Alterar senha', style: TextStyle(color: Colors.black,fontSize: 17)),
              onTap: () => {Navigator.pushNamed(context, '/senha')},
            ),

          ],
        ),
      ),

      body: Container(
        // decoration: BoxDecoration(
        // image: DecorationImage(
        // image: AssetImage("assets/blueee.png"),
        // fit: BoxFit.cover,
        // ),
        // ),
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(32, 16, 32, 2),
                  child: RaisedButton(
                      child: Text(
                        "Lista de Usuários",
                        style: TextStyle(color: Colors.black, fontSize: 21),
                      ),
                      color: Colors.blue[500],
                      padding: EdgeInsets.fromLTRB(70, 16, 70, 16),
                      onPressed: () {
                        Navigator.pushNamed(context, '/lista');
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                  child: RaisedButton(
                      child: Text(
                        "Lista de Unidades",
                        style: TextStyle(color: Colors.black, fontSize: 21),
                      ),
                      color: Colors.blue[500],
                      padding: EdgeInsets.fromLTRB(70, 16, 70, 16),
                      onPressed: () {
                        Navigator.pushNamed(context, '/listaUs');
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                ),
              ],
            ),
          ),
        ),
      ),

      // body: Container(
      //     decoration: BoxDecoration(
      //     image: DecorationImage(
      //     image: AssetImage("assets/blueee.png"),
      //     fit: BoxFit.cover,
      //     ),
      //     ),
      //   padding: EdgeInsets.all(16),
      //   child:  Center(
      //     child: SingleChildScrollView(
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.stretch,
      //         children: <Widget>[
      //           Container(
      //             child: Text(
      //             "Para recuperar a sua senha, informe o seu email de cadastro no formulário e clique em Enviar.\n",
      //             textAlign: TextAlign.center,
      //             style: TextStyle(color: Colors.black, fontSize: 17),
      //             ),
      //           ),
      //           TextField(
      //             controller: _controllerRSenha,
      //             autofocus: true,
      //             keyboardType: TextInputType.text,
      //             style: TextStyle(fontSize:20),
      //             decoration: InputDecoration(
      //               contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
      //               hintText: "Email",
      //               filled: true,
      //               fillColor: Colors.white,
      //               border: OutlineInputBorder(
      //                 borderRadius: BorderRadius.circular(10)
      //               ),
      //             ),
      //           ),
      //           Padding(
      //             padding: EdgeInsets.fromLTRB(70, 16, 70, 2),
      //             child: RaisedButton(
      //               child: Text(
      //                 "Enviar",
      //                 style: TextStyle(color: Colors.white, fontSize: 20),
      //               ),
      //               color: Colors.pink,
      //               padding: EdgeInsets.fromLTRB(70, 16, 70, 16),
      //               onPressed: (){

      //               },
      //               shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
      //             ),
      //             ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
