import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class BotonesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondoApp(),
          SingleChildScrollView(
              child: Column(
            children: <Widget>[
              _titulos(),
              _botonesRedondeados(),
            ],
          ))
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _fondoApp() {
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset(0.0, 0.6),
              end: FractionalOffset(0.0, 1.0),
              colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0)
          ])),
    );

    final cajaRosa = Transform.rotate(
        angle: -pi / 5.0,
        child: Container(
          height: 360.0,
          width: 360.0,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromRGBO(236, 98, 188, 1.0),
                Color.fromRGBO(241, 142, 172, 1.0)
              ]),
              borderRadius: BorderRadius.circular(80.0)),
        ));

    return Stack(children: <Widget>[
      gradiente,
      Positioned(child: cajaRosa, top: -100),
    ]);
  }

  Widget _titulos() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Classify transaction',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 10.0),
            Text('Classify this transaction into a particular category.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                )),
          ],
        ),
      ),
    );
  }

  // un BottomNavigation con un tema especial / estilo especial usando Theme
  Widget _bottomNavigationBar(BuildContext context) {
    // Crear un template para modificar el bottom navigation bar
    return Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
            primaryColor: Colors.pinkAccent,
            textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0)))),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today), title: Container()),
            BottomNavigationBarItem(
                icon: Icon(Icons.pie_chart_outlined), title: Container()),
            BottomNavigationBarItem(
                icon: Icon(Icons.supervised_user_circle), title: Container()),
          ],
        ));
  }

  // Widget Table, un los TableRow deben tener la misma cantidad de Widgets
  Widget _botonesRedondeados() {
    return Table(
      children: [
        TableRow(children: [
          _creatBotonRedondeado(Colors.blue, Icons.border_all, 'General'),
          _creatBotonRedondeado(Colors.green, Icons.shopping_cart, 'Buy')
        ]),
        TableRow(children: [
          _creatBotonRedondeado(Colors.indigo, Icons.email, 'Email'),
          _creatBotonRedondeado(Colors.lime, Icons.memory, 'Memory')
        ]),
        TableRow(children: [
          _creatBotonRedondeado(Colors.redAccent, Icons.save, 'Save'),
          _creatBotonRedondeado(Colors.teal, Icons.score, 'Score')
        ]),
        TableRow(children: [
          _creatBotonRedondeado(Colors.limeAccent, Icons.search, 'Search'),
          _creatBotonRedondeado(Colors.red, Icons.remove, 'Remove')
        ])
      ],
    );
  }

  Widget _creatBotonRedondeado(Color color, IconData icon, String texto) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          height: 180.0,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Color.fromRGBO(62, 66, 107, 0.7),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(height: 5.0),
              CircleAvatar(
                  backgroundColor: color,
                  radius: 35.0,
                  child:
                      Icon(Icons.swap_calls, color: Colors.white, size: 30.0)),
              Text(texto, style: TextStyle(color: color)),
              SizedBox(height: 5.0)
            ],
          ),
        ),
      ),
    );
  }
}
