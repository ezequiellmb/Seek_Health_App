import 'package:flutter/material.dart';


class Mapa extends StatefulWidget {
    @override 
    _MapaState createState() => _MapaState();
}
class _MapaState extends State<Mapa>{
      TextEditingController _controllerNome = TextEditingController();
      @override
      Widget build(BuildContext context){
    return new Scaffold(
      
      body: new Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/seek.jpg"),
            fit: BoxFit.cover,
              ),
            ),
      ),
    );
  }
}
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //   appBar: AppBar(
  //         title: Center(
  //           child: Text('MAPA',
  //           textAlign: TextAlign.end),
  //         ),
  //       ), 
  //       backgroundColor: Colors.white,
  //       body: Container(
  //         padding: EdgeInsets.all(16),
  //         child:  Center(
  //           child: SingleChildScrollView(
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.stretch,
  //               children: <Widget>[
  //                 TextField(
  //                   controller: _controllerNome,
  //                   autofocus: true,
  //                   keyboardType: TextInputType.text,
  //                   style: TextStyle(fontSize:20),
  //                   decoration: InputDecoration(
  //                     contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
  //                     hintText: "ENDEREÇO",
  //                     filled: true,
  //                     fillColor: Colors.white30,
  //                     border: OutlineInputBorder(
  //                       borderRadius: BorderRadius.circular(10)
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //     );
    // }
