import 'package:flutter/material.dart';
import 'package:flutter_login_project/personalInfo.dart';
import 'modelData.dart';

import 'package:flutter/material.dart';
import 'modelclass.dart';

class FetchedDataPage extends StatefulWidget {
  final List<DatabaseModel> fetchedData;

  FetchedDataPage({required this.fetchedData});

  @override
  _FetchedDataPageState createState() => _FetchedDataPageState();
}

class _FetchedDataPageState extends State<FetchedDataPage> {
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
        title: Text('Fetched Data'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.fetchedData.length,
              itemBuilder: (context, index) {
                final data = widget.fetchedData[index];
                Color bgColor = index % 2 == 0 ? Colors.black26 : Colors.black12;
                return Container(
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(bottom: 16.0),
                  child: ListTile(
                    title: Row(
                      children: [
                        Text("Name: ${data.name}"),
                        SizedBox(width: 10,),
                        Text("Role: ${data.roleTraining}"),
                      ],
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Options"),
                            content: Text("Choose an action:"),
                            actions: [
                              FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => SelectedResumePage(selectedResume: data),
                                    ),
                                  );
                                },
                                child: Text("Edit"),
                              ),
                              FlatButton(
                                onPressed: () async {
                                  await dbHelper.deleteData(data.email);
                                  Navigator.pop(context); // Close the dialog
                                },
                                child: Text("Delete"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


class SelectedResumePage extends StatelessWidget {
  final DatabaseModel selectedResume;

  SelectedResumePage({required this.selectedResume});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedResume.name),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Navigate to the editing screen with the selected resume
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PersonalInfo(editingResume: selectedResume, status: true,),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(""), // Use the URL of the candidate's photo
                    radius: 60,
                  ),
                  Icon(
                    Icons.person,
                    size: 100, // Adjust the size as needed
                    color: Colors.white, // Adjust the color as needed
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Personal Information',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Container(
              padding: EdgeInsets.all(16.0), // Add padding around the content
              decoration: BoxDecoration(
                color: Colors.green[100], // Light grey background color
                borderRadius: BorderRadius.circular(10.0), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // Shadow offset
                  ),
                ],
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text('Email'),
                    subtitle: Text(selectedResume.email),
                  ),
                  ListTile(
                    title: Text('Address'),
                    subtitle: Text(selectedResume.address),
                  ),
                  ListTile(
                    title: Text('Mobile No'),
                    subtitle: Text(selectedResume.mobileNo),
                  ),
                  ListTile(
                    title: Text('LinkedIn URL'),
                    subtitle: Text(selectedResume.linkedInUrl),
                  ),
                  ListTile(
                    title: Text('About Yourself'),
                    subtitle: Text(selectedResume.yourSelf),
                  ),
                ],
              ),
            ),
            Divider(),
            Text(
              'Skills and Courses',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Container(
              padding: EdgeInsets.all(16.0), // Add padding around the content
              decoration: BoxDecoration(
                color: Colors.orangeAccent[100], // Light grey background color
                borderRadius: BorderRadius.circular(10.0), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // Shadow offset
                  ),
                ],
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text('Programming Language'),
                    subtitle: Text(selectedResume.progLanguage),
                  ),
                  ListTile(
                    title: Text('Currently Working'),
                    subtitle: Text(selectedResume.currentlyWorking),
                  ),
                ],
              ),
            ),
            Divider(),
            Text(
              'Education Details',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Container(
              padding: EdgeInsets.all(16.0), // Add padding around the content
              decoration: BoxDecoration(
                color: Colors.green[100], // Light grey background color
                borderRadius: BorderRadius.circular(10.0), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // Shadow offset
                  ),
                ],
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text('Degree'),
                    subtitle: Text(selectedResume.degree),
                  ),
                  ListTile(
                    title: Text('School/College'),
                    subtitle: Text(selectedResume.schoolOrCollege),
                  ),
                  ListTile(
                    title: Text('Percentage'),
                    subtitle: Text(selectedResume.percentage),
                  ),
                ],
              ),
            ),

            Divider(),
            Text(
              'Personal Details',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Container(
              padding: EdgeInsets.all(16.0), // Add padding around the content
              decoration: BoxDecoration(
                color: Colors.orangeAccent[100], // Light grey background color
                borderRadius: BorderRadius.circular(10.0), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // Shadow offset
                  ),
                ],
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text('Degree'),
                    subtitle: Text(selectedResume.degree),
                  ),
                  ListTile(
                    title: Text('School/College'),
                    subtitle: Text(selectedResume.schoolOrCollege),
                  ),
                  ListTile(
                    title: Text('Percentage'),
                    subtitle: Text(selectedResume.percentage),
                  ),
                ],
              ),
            ),
            Divider(),
            Text(
              'Other Details',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Container(
              padding: EdgeInsets.all(16.0), // Add padding around the content
              decoration: BoxDecoration(
                color: Colors.green[100], // Light grey background color
                borderRadius: BorderRadius.circular(10.0), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // Shadow offset
                  ),
                ],
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text('Date of Birth'),
                    subtitle: Text(selectedResume.dob),
                  ),
                  ListTile(
                    title: Text('Nationality'),
                    subtitle: Text(selectedResume.nationality),
                  ),
                  ListTile(
                    title: Text('Gender'),
                    subtitle: Text(selectedResume.gender),
                  ),
                  ListTile(
                    title: Text('Languages'),
                    subtitle: Text(selectedResume.languages),
                  ),
                  ListTile(
                    title: Text('Marital Status'),
                    subtitle: Text(selectedResume.maritalStatus),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
