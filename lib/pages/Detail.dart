import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:seekhealth/pages/ListaUsuario.dart';
import 'package:seekhealth/pages/edita.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.index,this.list});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  void delete(){
    var url="http://192.168.0.16/seekhealth/delete.php";
    http.post(url, body:{
      'idUsuario': widget.list[widget.index]['idUsuario']
    });
  }

  void Confirmar(){
    AlertDialog alertDialog = new AlertDialog(
      backgroundColor: Colors.red[100],
      content: new Text("   Excluir ${widget.list[widget.index]['nome']}?", style: new TextStyle(color: Colors.black, fontSize: 16.0),),
      actions: <Widget>[
        new RaisedButton(
          
          child: new Text("Sim", style: new TextStyle(color: Colors.black),),
          color: Colors.blue,
          shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0)
          ),
          onPressed: (){
            delete();
            Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context) => ListaUser(),
            )
            );
          },
        ),
        new RaisedButton(
          child: new Text("Cancelar", style: new TextStyle(color: Colors.black),),
          color: Colors.red[200],
          shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0)
          ),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text("${widget.list[widget.index]['nome']}"),
      backgroundColor: Colors.blue,
      ),
      body: new Container(
          height: 700,
          padding: const EdgeInsets.all(10.0),
          child: new Card(
            color: Colors.blue[50],
            child: new Center(
              child: new Column(
                children: <Widget>[
                  new Padding(padding: const EdgeInsets.only(top: 30.0),),
                  new Text(widget.list[widget.index]['nome'],style: new TextStyle(fontSize: 20.0),),
                  Divider(),
                  new Text("${widget.list[widget.index]['email']}", style: new TextStyle(fontSize: 18.0,color: Colors.black),
                  ),
                  Divider(),
                  new Text("${widget.list[widget.index]['endereco']}", style: new TextStyle(fontSize: 18.0,color: Colors.black),
                  ),
                  Divider(),
                  new Text("${widget.list[widget.index]['usuario']}", style: new TextStyle(fontSize: 18.0,color: Colors.black),
                  ),
                  Divider(),
                  new Text("${widget.list[widget.index]['senha']}", style: new TextStyle(fontSize: 18.0,color: Colors.black),
                  ),
                  new Padding(padding:const EdgeInsets.only(top: 30.0),),
                  new Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new RaisedButton(
                        child: new Text("Editar",
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                        ),
                        color: Colors.blueGrey,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)
                        ),
                        onPressed: ()=>Navigator.of(context).push(
                          new MaterialPageRoute(
                            builder: (BuildContext context)=>new Edit(list:widget.list, index: widget.index,),
                          )
                        ),
                      ),
                      VerticalDivider(),
                      new RaisedButton(
                        child: new Text("Excluir",
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                        ),
                        color: Colors.red[900],
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                        onPressed: ()=>Confirmar(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
      )
      

      
    );
  }
}