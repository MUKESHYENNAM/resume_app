import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_project/Comm/genTextFormField.dart';
import 'package:flutter_login_project/pojo.dart';
import 'package:provider/provider.dart';
import 'Comm/Textheader.dart';
import 'educationPage3.dart';
import 'modelData.dart';
import 'personalInfo.dart';


class SkillsData extends StatefulWidget {
  final DatabaseModel? editingResume;
  final bool? status;
  SkillsData({ this.status, this.editingResume});
  @override
  _SkillsDataState createState() => _SkillsDataState();
}

class _SkillsDataState extends State<SkillsData> {
  final _formKey = new GlobalKey<FormState>();

  final _progLanguage = TextEditingController();
  final _currentlyWorking = TextEditingController();
  final _skills = TextEditingController();
  final _hobbies = TextEditingController();
  final _courses = TextEditingController();

  @override
  void initState() {
    super.initState();
    _progLanguage.text = widget.editingResume?.progLanguage ?? '';
    _currentlyWorking.text = widget.editingResume?.currentlyWorking ?? '';
    _skills.text = widget.editingResume?.skills ?? '';
    _hobbies.text = widget.editingResume?.hobbies ?? '';
    _courses.text = widget.editingResume?.courses ?? '';
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skills & Courses'),
      ),
      body: Column(
        children: [
          HeaderText(hintName: "Programming language & Skills",),
          Expanded(child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 20,),

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
                          name: "Enter Your Hobbies",
                          controller: _hobbies,
                          inputType: TextInputType.text,
                          icon: Icons.phone_android,
                          hintName: 'Hobbies',
                        ),
                        SizedBox(height: 10.0),
                        getTextFormField(
                          name: "Courses",
                          controller: _courses,
                          hintName: 'Enter Courses',
                          icon: Icons.account_tree_outlined,
                        ),
                        SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
          Row(
            children: [
              Expanded(
                child: Container(
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

                        print('Name: ${personalInfo.name}');
                        print('Email: ${personalInfo.email}');
                        personalInfo = personalInfo.copyWith(
                          progLanguage: _progLanguage.text,
                          currentlyWorking: _currentlyWorking.text,
                          skills: _skills.text,
                          hobbies: _hobbies.text,
                          courses: _courses.text,
                        );
                        personalInfoProvider.updatePersonalInfo(personalInfo);

                        // Navigate to the next page

                        if(widget.status==true){
                          Navigator.push(context, MaterialPageRoute(builder: (_) => EducationDetails(editingResume: widget.editingResume, status: true,)));
                        }else{
                          Navigator.push(context, MaterialPageRoute(builder: (_) => EducationDetails()));
                        }
                      }
                    },
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


}



