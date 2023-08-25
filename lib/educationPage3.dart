import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_project/Comm/genTextFormField.dart';
import 'package:flutter_login_project/personalDetailsallPage4.dart';
import 'package:flutter_login_project/pojo.dart';
import 'package:provider/provider.dart';
import 'Comm/Textheader.dart';
import 'modelData.dart';
import 'personalInfo.dart';


class EducationDetails extends StatefulWidget {
  final DatabaseModel? editingResume;
  final bool? status;
  EducationDetails({ this.status, this.editingResume});
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
    _Degree.text = widget.editingResume?.degree ?? '';
    _schoolandCollegs.text = widget.editingResume?.schoolOrCollege ?? '';
    _percentage.text = widget.editingResume?.percentage ?? '';
    _roleTraining.text = widget.editingResume?.roleTraining ?? '';
    _CompnayTraining.text = widget.editingResume?.companyTraining ?? '';
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
                      inputType: TextInputType.number,
                      hintName: 'Enter Percentage or CGPA'),
                  SizedBox(height: 10.0),
                  Text("Training/Intership"),
                  getTextFormField(
                    name: "Role",
                    controller: _roleTraining,
                    inputType: TextInputType.text,
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
                      Expanded(child: Container(
                        margin: EdgeInsets.all(10.0),
                        child: FlatButton(
                          child: Text(
                            'Next',
                            style: TextStyle(color: Colors.white),
                          ),

                          onPressed: () {
                            if (!_formKey.currentState!.validate()) {
                              return null;
                            } else {
                              // Store the data in the provider
                              PersonalInfoProvider personalInfoProvider =
                              Provider.of<PersonalInfoProvider>(context, listen: false);
                              PersonalInformation personalInfo = personalInfoProvider.personalInfo;
                              personalInfo = personalInfo.copyWith(
                                degree: _Degree.text,
                                schoolOrCollege: _schoolandCollegs.text,
                                percentage: _percentage.text,
                                roleTraining: _roleTraining.text,
                                companyTraining: _CompnayTraining.text,
                              );
                              personalInfoProvider.updatePersonalInfo(personalInfo);

                              if(widget.status==true){
                                Navigator.push(context, MaterialPageRoute(builder: (_) => personalAllDetails(editingResume: widget.editingResume, status: true,)));
                              }else{
                                Navigator.push(context, MaterialPageRoute(builder: (_) => personalAllDetails()));
                              }
                            }
                          },
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),)
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



