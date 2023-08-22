import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Comm/Textheader.dart';
import 'Comm/genTextFormField.dart';
import 'Skills_page2.dart';

class PersonalInfo extends StatefulWidget {
  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final _formKey = new GlobalKey<FormState>();

  final _firstName = TextEditingController();
  final _regEmail = TextEditingController();
  final _address = TextEditingController();
  final _MobileNo = TextEditingController();

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Build Your CV '),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20,),
                  Text("Parsonal Info"),
                  getTextFormField(
                    name: "Enter Your Name",
                       controller: _firstName,
                      icon: Icons.person,
                      hintName: 'first_Name'),
                  SizedBox(height: 10.0),
                  getTextFormField(
                      name: "Enter Your Email",
                      controller: _regEmail,
                      icon: Icons.email,
                      inputType: TextInputType.emailAddress,
                      hintName: 'Email'),
                  SizedBox(height: 10.0),
                  getTextFormField(
                      name: "Enterr Address",
                      controller: _address,
                      icon: Icons.home,
                      inputType: TextInputType.emailAddress,
                      hintName: 'Address'),
                  SizedBox(height: 10.0),
                  getTextFormField(
                    name: "Enterr Your Contact number",
                    controller: _MobileNo,
                    inputType: TextInputType.number,
                    icon: Icons.phone_android,
                    hintName: 'MobileNo',
                  ),
                  SizedBox(height: 10.0),
                  getTextFormField(
                    name: "Your LinkedIn Url",
                    hintName: 'Enter here',
                    icon: Icons.account_tree_outlined,
                  ),
                  SizedBox(height: 10.0),
                  getTextFormField(
                    name: "Describe yourself",
                    hintName: 'Start here',
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10.0),
                        child: FlatButton(
                          child: Text(
                            'Back',
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
                      Container(
                        margin: EdgeInsets.all(10.0),
                        child: FlatButton(
                          child: Text(
                            'Next',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => SkillsData()));
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
      ),
    );
  }
  showAlertDialog(BuildContext context, String msg) {
    AlertDialog alert = AlertDialog(
      title: Text("Here's a message"),
      content: Text("${msg}"),
      actions: [
        CupertinoDialogAction(child: Text("OK"), onPressed: () {
          Navigator.of(context).pop();
        },)

      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}
RegistrationDone(BuildContext context, String msg) {
  AlertDialog alert = AlertDialog(
    title: Text("Here's a message"),
    content: Text("${msg}"),
    actions: [

    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}



