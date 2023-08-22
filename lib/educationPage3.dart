import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_project/Comm/genTextFormField.dart';
import 'package:flutter_login_project/personalDetailsallPage4.dart';
import 'personalInfo.dart';


class EducationDetails extends StatefulWidget {
  @override
  _EducationDetailsState createState() => _EducationDetailsState();
}

class _EducationDetailsState extends State<EducationDetails> {
  final _formKey = new GlobalKey<FormState>();

  final _Degree = TextEditingController();
  final _schoolandCollegs = TextEditingController();
  final _percentage = TextEditingController();
  final _roleTraining = TextEditingController();
  final _CompnayTraining = TextEditingController();

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Educations'),
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
                  Text("Educations Qualification"),
                  SizedBox(height: 20,),
                  getTextFormField(
                      name: "Degree",
                      controller: _Degree,
                      icon: Icons.cast_for_education,
                      hintName: 'Enter Degree'),
                  SizedBox(height: 10.0),
                  getTextFormField(
                      name: "School Or College",
                      controller: _schoolandCollegs,
                      icon: Icons.cast_for_education,
                      inputType: TextInputType.emailAddress,
                      hintName: 'working on'),
                  SizedBox(height: 10.0),
                  getTextFormField(
                      name: "Percentage / CGPA",
                      controller: _percentage,
                      icon: Icons.home,
                      inputType: TextInputType.emailAddress,
                      hintName: 'Enter Percentage or CGPA'),
                  SizedBox(height: 10.0),
                  Text("Training/Intership"),
                  getTextFormField(
                    name: "Role",
                    controller: _roleTraining,
                    inputType: TextInputType.number,
                    icon: Icons.phone_android,
                    hintName: 'Enter Role',
                  ),
                  SizedBox(height: 10.0),
                  getTextFormField(
                    name: "Company name",
                    controller: _CompnayTraining,
                    hintName: 'Enter Company',
                    icon: Icons.account_tree_outlined,
                  ),
                  SizedBox(height: 10.0),

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
                            print("caling");
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => personalAllDetails()));
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



