import 'package:flutter/material.dart';
import 'package:seekhealth/pages/Adm.dart';


class Adm extends StatefulWidget {
    @override 
    _AdmState createState() => _AdmState();
}
class _AdmState extends State<Adm>{
      TextEditingController _controllerRSenha = TextEditingController();
      @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        title: Text("ADMINISTRADOR"),
        backgroundColor: Colors.black,
        ),
        drawer: new Drawer(
          child: ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
              accountName: new Text('Ezequiel'),
              accountEmail: new Text('ezequiel@gmail.com'),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new NetworkImage('http://i.pravatar.cc/300'),
              ),
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
          child:  Center(
            child: SingleChildScrollView(
              child: Column(
                
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(32, 16, 32, 2),
                    child: RaisedButton(
                      child: Text(
                        "Lista de Usuários",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      color: Colors.white,
                      padding: EdgeInsets.fromLTRB(70, 16, 70, 16),
                      onPressed: (){
                        Navigator.pushNamed(context, '/lista');
                      },
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                    ),
                    ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    child: RaisedButton(
                      child: Text(
                        "Lista de Unidades",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      color: Colors.white,
                      padding: EdgeInsets.fromLTRB(70, 16, 70, 16),
                      onPressed: (){
                        Navigator.pushNamed(context, '/listaUs');
                      },
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                    ),
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