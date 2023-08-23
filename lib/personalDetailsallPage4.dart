import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_project/Comm/genTextFormField.dart';
import 'package:flutter_login_project/pojo.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'modelData.dart';
import 'modelclass.dart';
import 'personalInfo.dart';


class personalAllDetails extends StatefulWidget {
  @override
  _personalAllDetailsState createState() => _personalAllDetailsState();
}

class _personalAllDetailsState extends State<personalAllDetails> {
  final _formKey = new GlobalKey<FormState>();

  final _dob = TextEditingController();
  final _nationality = TextEditingController();
  final _gender = TextEditingController();
  final _languages = TextEditingController();
  final _maritalstatus = TextEditingController();
// Initialize DatabaseHelper
  var dbHelper;
  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Details'),
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
                  Text("Your Details"),
                  SizedBox(height: 20,),
                  getTextFormField(
                      name: "Date of Birth",
                      controller: _dob,
                      icon: Icons.cast_for_education,
                      hintName: 'Enter Degree'),
                  SizedBox(height: 10.0),
                  getTextFormField(
                      name: "Nationality",
                      controller: _nationality,
                      icon: Icons.cast_for_education,
                      inputType: TextInputType.emailAddress,
                      hintName: 'working on'),
                  SizedBox(height: 10.0),
                  getTextFormField(
                      name: "Gender",
                      controller: _gender,
                      icon: Icons.home,
                      inputType: TextInputType.emailAddress,
                      hintName: 'Enter Percentage or CGPA'),
                  SizedBox(height: 10.0),
                  getTextFormField(
                    name: "Languages",
                    controller: _languages,
                    inputType: TextInputType.number,
                    icon: Icons.phone_android,
                    hintName: 'Enter Role',
                  ),
                  SizedBox(height: 10.0),
                  getTextFormField(
                    name: "Marital Status",
                    controller: _maritalstatus,
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
                            'Submit',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async{
                            if (!_formKey.currentState!.validate()) {
                              return null;
                            } else {
                              // Store the data in the provider
                              PersonalInfoProvider personalInfoProvider =
                              Provider.of<PersonalInfoProvider>(context, listen: false);
                              PersonalInformation personalInfo = personalInfoProvider.personalInfo;
                              personalInfo = personalInfo.copyWith(
                                dob: _dob.text,
                                nationality: _nationality.text,
                                gender: _gender.text,
                                languages: _languages.text,
                                maritalStatus: _maritalstatus.text,
                              );
                              personalInfoProvider.updatePersonalInfo(personalInfo);
                              DatabaseModel databaseModel = DatabaseModel(
                                dob: _dob.text,
                                nationality: _nationality.text,
                                gender: _gender.text,
                                languages: _languages.text,
                                maritalStatus: _maritalstatus.text,
                                name: Provider.of<PersonalInfoProvider>(context, listen: false).personalInfo.name,
                                email: Provider.of<PersonalInfoProvider>(context, listen: false).personalInfo.email,
                                address: Provider.of<PersonalInfoProvider>(context, listen: false).personalInfo.address,
                                mobileNo: Provider.of<PersonalInfoProvider>(context, listen: false).personalInfo.mobileNo,
                                linkedInUrl: Provider.of<PersonalInfoProvider>(context, listen: false).personalInfo.linkedInUrl,
                                yourSelf: Provider.of<PersonalInfoProvider>(context, listen: false).personalInfo.yourSelf,
                                progLanguage: Provider.of<PersonalInfoProvider>(context, listen: false).personalInfo.progLanguage,
                                currentlyWorking: Provider.of<PersonalInfoProvider>(context, listen: false).personalInfo.currentlyWorking,
                                skills: Provider.of<PersonalInfoProvider>(context, listen: false).personalInfo.skills,
                                hobbies: Provider.of<PersonalInfoProvider>(context, listen: false).personalInfo.hobbies,
                                courses: Provider.of<PersonalInfoProvider>(context, listen: false).personalInfo.courses,
                                degree: Provider.of<PersonalInfoProvider>(context, listen: false).personalInfo.degree,
                                schoolOrCollege: Provider.of<PersonalInfoProvider>(context, listen: false).personalInfo.schoolOrCollege,
                                percentage: Provider.of<PersonalInfoProvider>(context, listen: false).personalInfo.percentage,
                                roleTraining: Provider.of<PersonalInfoProvider>(context, listen: false).personalInfo.roleTraining,
                                companyTraining: Provider.of<PersonalInfoProvider>(context, listen: false).personalInfo.companyTraining,
                              );

                              await dbHelper.insertData(databaseModel);
                              // Navigate to the next page
                              // Navigate to the next page
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => StartFile(),
                                ),
                              );
                            }
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
}



