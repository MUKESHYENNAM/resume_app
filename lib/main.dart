import 'package:flutter/material.dart';
import 'package:flutter_login_project/Comm/genTextFormField.dart';
import 'Comm/Textheader.dart';
import 'personalInfo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: startfile(),
    );
  }
}
class startfile extends StatefulWidget {
  @override
  _startfileState createState() => _startfileState();
}

class _startfileState extends State<startfile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
           child: Column(
             children: [
               SizedBox(height: 30,),
               textHeader('Hello There!'),
               SizedBox(height: 10,),
               Text("Creator Resume \n Content creation is currently one of the fastest-growing,\n if not the fastest-growing profession in the world.", textAlign: TextAlign.center,),
               SizedBox(height: 20,),
               Image.asset('assets/New Project.jpg'),
               SizedBox(height: 20,),
               Column(
                 children: [
                   Container(
                     margin: EdgeInsets.all(10.0),
                     width: double.infinity,
                     child: FlatButton(
                       child: Text(
                         'Create Resume',
                         style: TextStyle(color: Colors.white),
                       ),
                       onPressed: () {
                         Navigator.push(context,
                             MaterialPageRoute(builder: (_) => PersonalInfo()));
                       },
                     ),
                     decoration: BoxDecoration(
                       color: Colors.blue,
                       borderRadius: BorderRadius.circular(30.0),
                     ),
                   ),
                 ],
               ),
             ],
           ),
          ),
        ),
      ),
    );
  }
}