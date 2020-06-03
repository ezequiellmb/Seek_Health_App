import 'package:flutter/material.dart';
import 'package:seekhealth/pages/ListaUsuario.dart';
import 'package:seekhealth/pages/login.page.dart';
import 'package:seekhealth/pages/edita.dart';


import 'pages/Rotas.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
      title: 'Seek Health',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: Login(),
      initialRoute: "/",
      onGenerateRoute: Rotas.geraRota,
  );
  }
}








