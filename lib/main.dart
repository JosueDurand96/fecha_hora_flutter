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
        padding: EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
            Text('Fecha seleccionada: ${_date.toString()}'),
            RaisedButton(
              child: Text('Seleccionar fecha'),
              onPressed: () {
                _selectTable(context);
              },
            ),
            Text('Hora seleccionada: ${_time.toString()}'),
            RaisedButton(
              child: Text('Seleccionar Hora'),
              onPressed: () {
                _selectTable(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
