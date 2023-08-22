import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_project/Comm/genTextFormField.dart';
import 'educationPage3.dart';
import 'personalInfo.dart';


class SkillsData extends StatefulWidget {
  @override
  _SkillsDataState createState() => _SkillsDataState();
}

class _SkillsDataState extends State<SkillsData> {
  final _formKey = new GlobalKey<FormState>();

  final _progLanguage = TextEditingController();
  final _currentlyWorking = TextEditingController();
  final _skills = TextEditingController();
  final _hobbies = TextEditingController();

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skills & Courses'),
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
                  Text("Programming language & Skills"),
                  SizedBox(height: 20,),
                  getTextFormField(
                      name: "Enter Programming Languages",
                      controller: _progLanguage,
                      icon: Icons.code,
                      hintName: 'Programming Languages'),
                  SizedBox(height: 10.0),
                  getTextFormField(
                      name: "Currently working on",
                      controller: _currentlyWorking,
                      icon: Icons.email,
                      inputType: TextInputType.emailAddress,
                      hintName: 'working on'),
                  SizedBox(height: 10.0),
                  getTextFormField(
                      name: "Enter Your Skills",
                      controller: _skills,
                      icon: Icons.home,
                      inputType: TextInputType.emailAddress,
                      hintName: 'Skills'),
                  SizedBox(height: 10.0),
                  getTextFormField(
                    name: "Enterr Your Hobbies",
                    controller: _hobbies,
                    inputType: TextInputType.number,
                    icon: Icons.phone_android,
                    hintName: 'Hobbies',
                  ),
                  SizedBox(height: 10.0),
                  getTextFormField(
                    name: "Courses",
                    hintName: 'Enter Courses',
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
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => EducationDetails()));
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



