import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_project/modelclass.dart';
import 'package:flutter_login_project/pojo.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'Comm/Textheader.dart';
import 'Comm/genTextFormField.dart';
import 'Skills_page2.dart';
import 'modelData.dart';

class PersonalInfo extends StatefulWidget {
  final DatabaseModel? editingResume;
  final bool? status;
  PersonalInfo({ this.status, this.editingResume});
  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final _formKey = new GlobalKey<FormState>();

  final _CondidateName = TextEditingController();
  final _regEmail = TextEditingController();
  final _address = TextEditingController();
  final _MobileNo = TextEditingController();
  final _linkedInUrl = TextEditingController();
  final _yourSelf = TextEditingController();
  @override
  void initState() {
    super.initState();
    _CondidateName.text = widget.editingResume?.name ?? '';
    _regEmail.text =  widget.editingResume?.email ?? '';
    _address.text = widget.editingResume?.address ?? '';
    _MobileNo.text = widget.editingResume?.mobileNo ?? '';
    _linkedInUrl.text =widget.editingResume?.linkedInUrl ?? '';
    _yourSelf.text = widget.editingResume?.yourSelf ?? '';
  }
  @override
  void dispose() {
    _CondidateName.dispose();
    _regEmail.dispose();
    _address.dispose();
    _MobileNo.dispose();
    _linkedInUrl.dispose();
    _yourSelf.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.status==true?"Edit Your CV":"Edit Build Your CV"}'),
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
                  Text("Personal Info"),
                  getTextFormField(
                    name: "Enter Your Name",
                       controller: _CondidateName,
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
                    controller: _linkedInUrl,
                    icon: Icons.account_tree_outlined,
                  ),
                  SizedBox(height: 10.0),
                  getTextFormField(
                    name: "Describe yourself",
                    controller: _yourSelf,
                    hintName: 'Start here',
                  ),
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
                              print("ID::: ${widget.editingResume?.email}");
                              if (!_formKey.currentState!.validate()) {
                                return null;
                              } else {
                                // Store the data in the provider
                                PersonalInformation personalInfo = PersonalInformation(
                                  name: _CondidateName.text,
                                  email: _regEmail.text,
                                  address: _address.text,
                                  mobileNo: _MobileNo.text,
                                  linkedInUrl: _linkedInUrl.text,
                                  yourSelf: _yourSelf.text,

                                  progLanguage: '', // Default value for programming language
                                  currentlyWorking: '', // Default value for currently working
                                  skills: '', // Default value for skills
                                  hobbies: '', // Default value for hobbies
                                  courses: '', // Default value for courses

                                  degree: '',
                                  schoolOrCollege: '',
                                  percentage: '',
                                  roleTraining: '',
                                  companyTraining: '',

                                  gender: '',
                                  nationality: '',
                                  dob: '',
                                  languages: '',
                                  maritalStatus: '',
                                );
                                Provider.of<PersonalInfoProvider>(context, listen: false)
                                    .updatePersonalInfo(personalInfo);

                                if(widget.status==true){
                                  Navigator.push(context, MaterialPageRoute(builder: (_) => SkillsData(editingResume: widget.editingResume, status: true,)));
                                }else{
                                  Navigator.push(context, MaterialPageRoute(builder: (_) => SkillsData()));
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
            ),
          ),
        ),
      ),
    );
  }
}



class PersonalInfoProvider extends ChangeNotifier {
  PersonalInformation _personalInfo = PersonalInformation(
    name: '',
    email: '',
    address: '',
    mobileNo: '',
    linkedInUrl: '',
    yourSelf: '',

    progLanguage: '', // Default value for programming language
    currentlyWorking: '', // Default value for currently working
    skills: '', // Default value for skills
    hobbies: '', // Default value for hobbies
    courses: '',

    companyTraining: '',
    percentage: '',
    schoolOrCollege: '',
    gender: '',
    roleTraining: '',
    maritalStatus: '',
    dob: '',
    degree: '',
    nationality: '',
    languages: '',
  );

  PersonalInformation get personalInfo => _personalInfo;

  void updatePersonalInfo(PersonalInformation newInfo) {
    _personalInfo = newInfo;
    notifyListeners();
  }
}