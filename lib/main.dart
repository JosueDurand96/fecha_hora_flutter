import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(
   home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DateTime _date = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();

  Future<Null> _selectTable(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: new DateTime(2016),
        lastDate: DateTime(2030));
    if (picked != null && picked != _date) {
      print('Fecha seleccionada: ${_date.toString()}');
      setState(() {
        _date = picked;
      });
    }
  }

  Future<Null>_selectTime(BuildContext context)async{
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: _time);
    if (picked != null &&picked != _time){
      print('Seleccionar Hora: ${_time.toString()}');
      setState(() {
        _time = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        padding: EdgeInsets.only(bottom: 50,left: 20,right: 20,top: 70),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
             child: Text('Confirmar Reserva',  style: new TextStyle(
                 fontSize: 20.0, color: Colors.black),),
            ),

            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right:300.0),
              child: Text('Desde'),
            ),
            TextField(
              maxLines: 1,
              decoration: InputDecoration(
                hintText:'Fecha seleccionada: ${_date.toString()}',
                border: OutlineInputBorder(),
              ),
              onTap: () {
                _selectTable(context);
              },
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(right:300.0),
              child: Text('Hasta'),
            ),
            TextField(
              maxLines: 1,
              decoration: InputDecoration(
                hintText:'Hora seleccionada: ${_time.toString()}',
                border: OutlineInputBorder(),
              ),
              onTap: () {
                _selectTime(context);
              },
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(right:290.0),
              child: Text('Cancha'),
            ),
            TextField(
              maxLines: 1,
              decoration: InputDecoration(
                hintText:'Cancha 2 - Sede Miraflores:',
                border: OutlineInputBorder(),
              ),
              onTap: () {

              },
            ),
            SizedBox(height: 40),
            Container(
              alignment: Alignment.center,
              child:    Row(
                children: <Widget>[
                  SizedBox(width: 70.0),
                  Container(
                    alignment: Alignment.center,
                    child: new Container(
                      alignment: Alignment.center,
                      width: 80.0,
                      height: 40.0,
                      decoration: new BoxDecoration(
                          color: Colors.yellowAccent,
                          borderRadius: new BorderRadius.circular(0)),
                      child: new Text(
                        "SI",
                        style: new TextStyle(
                            fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(width: 50.0),
                  Container(
                    alignment: Alignment.center,
                    child: new Container(
                      alignment: Alignment.center,
                      width: 80.0,
                      height: 40.0,
                      decoration: new BoxDecoration(
                          color: Colors.yellowAccent,
                          borderRadius: new BorderRadius.circular(0)),
                      child: new Text(
                        "NO",
                        style: new TextStyle(
                            fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
