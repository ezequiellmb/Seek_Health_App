import 'dart:convert';

import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:seekhealth/pages/Detail.dart';
import 'package:seekhealth/pages/User.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {

  TextEditingController controllerEspecialidade = new TextEditingController();
  TextEditingController controllerTipo = new TextEditingController();
  TextEditingController controllerPP = new TextEditingController();

  Future<List> getUser() async {
    final response = await http.get("http://192.168.0.16/seekhealth/getdata.php");
    return json.decode(response.body);
  }
  bool isPesquisa = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: !isPesquisa
       ? Text("Especialidades")
       : TextField(
         style: TextStyle(color: Colors.white),
         decoration: InputDecoration(
           hintText: "Buscar especialidade",
           hintStyle: TextStyle(color: Colors.white),
         ),
       ),
       backgroundColor: Colors.indigo[900],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),

            onPressed: (){
              showSearch(context: context, delegate: Procura());
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            new UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/seek2.png'))),
              accountEmail: new Text("ezequiel@gmail.com",
                  style: TextStyle(color: Colors.black)),
              accountName: new Text("Ezequiel Mioranza",
                  style: TextStyle(color: Colors.black)),
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
              title: Text('Profile', style: TextStyle(color: Colors.black,fontSize: 21)),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.map, color: Colors.black, size: 25),
              title: Text('Mapa', style: TextStyle(color: Colors.black,fontSize: 21)),
              onTap: () => {Navigator.pushNamed(context, '/mapaaa')},
            ),
            ListTile(
              leading: Icon(Icons.border_color, color: Colors.black,size: 25),
              title: Text('Feedback', style: TextStyle(color: Colors.black,fontSize: 21)),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.black,size: 25),
              title: Text('Logout', style: TextStyle(color: Colors.black,fontSize: 21)),
              onTap: () => {Navigator.pushNamed(context, '/login')},
            ),
            Divider(
              height: 150,
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.black,size: 25),
              title: Text('Alterar senha', style: TextStyle(color: Colors.black,fontSize: 21)),
              onTap: () => {Navigator.pushNamed(context, '/senha')},
            ),

          ],
        ),
     ),
    body: new Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/blueee.png"),
            fit: BoxFit.cover,
          ),
      ),
      
      padding: EdgeInsets.all(16),
          child:  Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextField(
                    controller: controllerEspecialidade,  
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize:20),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: "Especialidade",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0)
                      )
                    ),
                  ),
                  Divider(),
                  TextField(
                    controller: controllerTipo,  
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize:20),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: "Tipo",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0)
                      )
                    ),
                  ),
                  Divider(),
                  TextField(
                    controller: controllerPP,  
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize:20),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: "PP",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0)
                      )
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(70, 70, 70, 2),//Distancia borda 
                      child: RaisedButton(
                        child: Text(
                          "Pesquisar",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        color: Colors.blue,
                        padding: EdgeInsets.fromLTRB(70, 16, 70, 16),//Distancia da escrita
                        onPressed: (){
                          Navigator.pushNamed(context, "/mapaaa");
                        },
                        // Borda do botão circular
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      ),
                  ),
                ],  
              ),
            ),
          ),
        ),
    );
  }
}

    @override
    Widget build(BuildContext context) {
    return Scaffold(
      // body: new FutureBuilder<List>(
      //   future: getUser(),
      //           builder: (context, snapshot) {
      //             if (snapshot.hasError) print(snapshot.error);
      //             return snapshot.hasData
      //                 ? new Listar(
      //                     list: snapshot.data,
      //                   )
      //                 : new Center(
      //                     child: new CircularProgressIndicator(),
      //                   );
      //           },
              // ),
      
    );
}
        
        getUser() {
}


class Listar extends StatelessWidget {
  final List list;
  Listar({this.list});
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return new Container(
            padding: const EdgeInsets.all(8.0),
            child: new GestureDetector(
              onTap: () => Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context) => new Detail(
                          list: list,
                          index: i,
                        )),
              ),
              child: new Card(
                color: Colors.blue[50],
                child: new ListTile(
                  title: new Text(
                    list[i]['nome'],
                    style: TextStyle(fontSize: 25.0, color: Colors.black),
                  ),
                  leading:
                      new Icon(Icons.person, size: 55.0, color: Colors.black),
                  subtitle: new Text(
                    "${list[i]['email']}",
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                ),
              ),
            ),
          );
        });
  }
  }

  class Procura extends SearchDelegate<String>{
  
  final filtros = [
    "Radiologia",
    "Estetica",
    "Cardiologia",
  ];

  final filtrosRecentes = [
    "Cardiologia",
  ];
  
  
  @override
  List<Widget> buildActions(BuildContext context) {
      return[IconButton(icon: Icon(Icons.clear),
       onPressed: () {
         query = "";
       },
       ),

       ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
          ), 
          onPressed: () {
            close(context, null);
          } 
          );
    }
  
    @override
    Widget buildResults(BuildContext context) {
      return Container(
        height: 100,
        width: 100,
        child: Card(
          color: Colors.grey,
          child: Center( 
            child: Text(query),
            ),
        ),
      );
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
      final sugestaoLista = query.isEmpty
      ?filtrosRecentes
      :filtros.where((p) => p.startsWith(query)).toList();

      return ListView.builder(itemBuilder: (context,index)=>ListTile(
        onTap: () {
          showResults(context);
        },

        leading: Icon(Icons.location_city),
        title: RichText(text: TextSpan(
          text: sugestaoLista[index].substring(0,query.length),
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          children: [TextSpan(
            text: sugestaoLista[index].substring(query.length),
            style: TextStyle(color: Colors.blue),
          ),
          ],
        ),
        ),  
      ),
      itemCount: sugestaoLista.length,
      );
  
  }
  
}

    
    //    body: Container(
    //     decoration: BoxDecoration(
    //     image: DecorationImage(
    //     image: AssetImage("assets/blueee.png"),
    //     fit: BoxFit.cover,
    //     ),
    //     ),
    //     padding: EdgeInsets.all(16),
    //     child: Center(
    //       child: SingleChildScrollView(
    //         child: Column(
    //           children: <Widget>[
    //             Padding(
    //               padding: EdgeInsets.fromLTRB(32, 16, 32, 2),
    //               child: RaisedButton(
    //                   child: Text(
    //                     "Público",
    //                     style: TextStyle(color: Colors.black, fontSize: 20),
    //                   ),
    //                   color: Colors.white,
    //                   padding: EdgeInsets.fromLTRB(70, 16, 70, 16),
    //                   onPressed: () {
    //                     Navigator.pushNamed(context, '');
    //                   },
    //                   shape: new RoundedRectangleBorder(
    //                       borderRadius: new BorderRadius.circular(30.0))),
    //             ),
    //             Padding(
    //               padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
    //               child: RaisedButton(
    //                   child: Text(
    //                     "Privado",
    //                     style: TextStyle(color: Colors.black, fontSize: 20),
    //                   ),
    //                   color: Colors.white,
    //                   padding: EdgeInsets.fromLTRB(70, 16, 70, 16),
    //                   onPressed: () {
    //                     Navigator.pushNamed(context, '');
    //                   },
    //                   shape: new RoundedRectangleBorder(
    //                       borderRadius: new BorderRadius.circular(30.0))),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
