import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:seekhealth/pages/Un_saude/Lista.dart';
import 'package:seekhealth/pages/Un_saude/Edita.dart';

class Delete extends StatefulWidget {
  List list;
  int index;
  Delete({this.index,this.list});
  @override
  _DeleteState createState() => _DeleteState();
}

class _DeleteState extends State<Delete> {
  Future<void> usdelete() async {
    var url="http://192.168.0.16/seekhealth/us_delete.php";
    http.post(url, body:{
      'us_id': widget.list[widget.index]['us_id']
    });
  }

  void Confirmar(){
    AlertDialog alertDialog = new AlertDialog(
      backgroundColor: Colors.red[100],
      content: new Text("   Excluir ${widget.list[widget.index]['us_nome']}?", style: new TextStyle(color: Colors.black, fontSize: 16.0),),
      actions: <Widget>[
        new RaisedButton(
          
          child: new Text("Sim", style: new TextStyle(color: Colors.black),),
          color: Colors.blue,
          shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0)
          ),
          onPressed: (){
            usdelete();
            Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context) => Lista(),
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
      appBar: AppBar(title: new Text("${widget.list[widget.index]['us_nome']}"),
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
                  new Text(widget.list[widget.index]['us_nome'],style: new TextStyle(fontSize: 20.0),),
                  Divider(),
                  new Text("${widget.list[widget.index]['us_endereco']}", style: new TextStyle(fontSize: 18.0,color: Colors.black),
                  ),
                  new Text("${widget.list[widget.index]['us_especialidade']}", style: new TextStyle(fontSize: 18.0,color: Colors.black),
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
                            builder: (BuildContext context)=>new Edita(list:widget.list, index: widget.index,),
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