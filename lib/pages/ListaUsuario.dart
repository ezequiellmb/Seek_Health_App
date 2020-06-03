import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:seekhealth/pages/Detail.dart';
import 'package:seekhealth/pages/registro.dart';

class ListaUser extends StatefulWidget {
  @override
  _ListaUserState createState() => _ListaUserState();
}

class _ListaUserState extends State<ListaUser> {
  Future<List> getData() async {
    final response = await http.get("http://192.168.0.16/seekhealth/getdata.php");
    return json.decode(response.body);
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
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: (){
          Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context)=> new Add(),
            ));
        }
        ),
        body: new FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot) {
            if(snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
            ? new ItemList(
              list: snapshot.data,
            )
            : new Center(
              child: new CircularProgressIndicator(),
              );
          },
        ),
    );
  }
}
class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
          itemCount: list == null ? 0 : list.length,
          itemBuilder: (context, i){
            return new Container(
              padding: const EdgeInsets.all(10.0),
              child: new GestureDetector(
                onTap: () => Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder: (BuildContext context) => new Detail(
                      list: list,
                      index: i,
                  )
                  ),
                ),
                child: new Card(
                  child: new ListTile(
                    title: new Text(
                      list[i]['nome'],
                      style: TextStyle(fontSize: 25.0, color: Colors.blue),
                    ),
                    leading: new Icon(
                      Icons.person_pin,
                      size:77.0,
                      color: Colors.blue
                    ),
                    subtitle: new Text(
                      "email : ${list[i]['email']}",
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                    ),
                ),
              ),
            );
          }
    );
      
  }
}