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
