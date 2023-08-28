import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_project/Comm/Textheader.dart';
import 'package:flutter_login_project/Comm/genTextFormField.dart';
import 'package:flutter_login_project/pojo.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'modelData.dart';
import 'modelclass.dart';
import 'personalInfo.dart';
import 'package:intl/intl.dart';

class personalAllDetails extends StatefulWidget {
  final DatabaseModel? editingResume;
  final bool? status;
  personalAllDetails({ this.status, this.editingResume});
  @override
  _personalAllDetailsState createState() => _personalAllDetailsState();
}

class _personalAllDetailsState extends State<personalAllDetails> {
  final _formKey = new GlobalKey<FormState>();
  DateTime _selectedDate = DateTime.now(); // Initialize with today's date
  final _dob = TextEditingController();
  final _nationality = TextEditingController();
  final _gender = TextEditingController();
  final _languages = TextEditingController();
  final _maritalstatus = TextEditingController();
  String dropdownvalue = 'Male';
  String dropdownMaritalStatusvalue = 'Married';

  var items = ['Male', 'Female', 'Other'];
  var marriageStatusOptions = ['Married', 'Single',];
// Initialize DatabaseHelper
  var dbHelper;
  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
    _dob.text = widget.editingResume?.dob ?? '';
    _nationality.text = widget.editingResume?.nationality ?? '';
    dropdownvalue = "Male";
    _languages.text = widget.editingResume?.languages ?? '';
    dropdownMaritalStatusvalue = 'Single';
  }
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dob.text = DateFormat('yyyy-MM-dd').format(_selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Details'),
      ),
      body: Column(
        children: [
          HeaderText(hintName:"Your Details"),
          Expanded(child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizedBox(height: 20,),
                        Text("Date of Birth"),
                        TextFormField(
                          controller: _dob,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0), // Set border radius
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            prefixIcon: Icon(Icons.calendar_today),
                            hintText: 'Enter Date of Birth',
                            labelText: 'Date of Birth',
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          onTap: () => _selectDate(context), // Show date picker
                          readOnly: true, // Make the text field read-only
                        ),
                        SizedBox(height: 10.0),
                        getTextFormField(
                            name: "Nationality",
                            controller: _nationality,
                            icon: Icons.cast_for_education,
                            inputType: TextInputType.emailAddress,
                            hintName: 'working on'),
                        SizedBox(height: 10.0),
                        SizedBox(height: 10.0),
                        getTextFormField(
                          name: "Languages",
                          controller: _languages,
                          inputType: TextInputType.text,
                          icon: Icons.phone_android,
                          hintName: 'Enter Languages',
                        ),
                        SizedBox(height: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Gender"),
                            Container(
                              width: double.infinity,
                              height: 60,
                              padding: EdgeInsets.symmetric(horizontal: 12.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(color: Colors.blueGrey),
                              ),
                              child: InputDecorator(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.person), // Replace with your desired prefix icon
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: dropdownvalue,
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    items: items.map((String item) {
                                      return DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(item),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownvalue = newValue!;
                                      });
                                    },
                                    isExpanded: true,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.0),
                            Text("Marital Status"),
                            Container(
                              width: double.infinity,
                              height: 60,
                              padding: EdgeInsets.symmetric(horizontal: 12.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: InputDecorator(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero, // Remove the default padding
                                  border: InputBorder.none, // Remove the default border
                                  prefixIcon: Icon(Icons.person), // Add the prefix icon
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: dropdownMaritalStatusvalue,
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    items: marriageStatusOptions.map((String item) {
                                      return DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(item),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownMaritalStatusvalue = newValue!;
                                      });
                                    },
                                    isExpanded: true,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
          Row(
            children: [
              Expanded(child:  Container(
                margin: EdgeInsets.all(10.0),
                child: FlatButton(
                  child: Text(
                    '${widget.status!=true  ? "Submit" : "Update"}',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async{
                    if (!_formKey.currentState!.validate()) {
                      return null;
                    } else {

                      if(widget.status==true){
                        print("_dob::${_dob.text}");
                        DatabaseModel EditdatabaseModel = DatabaseModel(
                          dob: _dob.text,
                          nationality: _nationality.text,
                          gender: dropdownvalue,
                          languages: _languages.text,
                          maritalStatus: dropdownMaritalStatusvalue,
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
                        await dbHelper.updateData(EditdatabaseModel);
                      }else{
                        // Store the data in the provider
                        PersonalInfoProvider personalInfoProvider =
                        Provider.of<PersonalInfoProvider>(context, listen: false);
                        PersonalInformation personalInfo = personalInfoProvider.personalInfo;
                        personalInfo = personalInfo.copyWith(
                          dob: _dob.text,
                          nationality: _nationality.text,
                          gender: dropdownvalue,
                          languages: _languages.text,
                          maritalStatus: dropdownMaritalStatusvalue,
                        );
                        personalInfoProvider.updatePersonalInfo(personalInfo);
                        DatabaseModel databaseModel = DatabaseModel(
                          dob: _dob.text,
                          nationality: _nationality.text,
                          gender: dropdownvalue,
                          languages: _languages.text,
                          maritalStatus: dropdownMaritalStatusvalue,
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
                      }
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
              ),)
            ],
          ),
        ],
      ),
    );
  }
}

