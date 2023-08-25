import 'package:flutter/material.dart';

class textHeader extends StatelessWidget {
  String headerName;

  textHeader(this.headerName);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 50.0),
          Text(
            headerName,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 35.0),
          ),
        ],
      ),
    );
  }
}

class BackButtonWithNavigation extends StatelessWidget {
  final String buttonText;
  final Widget destination;

  BackButtonWithNavigation({required this.buttonText, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: FlatButton(
        child: Text(
          buttonText,
          style: TextStyle(color: Colors.black),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => destination));
        },
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }
}




