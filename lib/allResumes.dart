import 'package:flutter/material.dart';
import 'package:flutter_login_project/personalInfo.dart';
import 'modelData.dart';

class FetchedDataPage extends StatelessWidget {
  final List<DatabaseModel> fetchedData;

  FetchedDataPage({required this.fetchedData});

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
              itemCount: fetchedData.length,
              itemBuilder: (context, index) {
                final data = fetchedData[index];
                return ListTile(
                  title: Text(data.name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SelectedResumePage(selectedResume: data),
                      ),
                    );
                  },
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
                  builder: (_) => PersonalInfo(),
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
              child: CircleAvatar(
                backgroundImage: NetworkImage(""), // Use the URL of the candidate's photo
                radius: 60,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Personal Information',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
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
            Divider(),
            Text(
              'Skills and Courses',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text('Programming Language'),
              subtitle: Text(selectedResume.progLanguage),
            ),
            ListTile(
              title: Text('Currently Working'),
              subtitle: Text(selectedResume.currentlyWorking),
            ),
            // ... Add more skills and courses fields
            Divider(),
            Text(
              'Education Details',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
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
            // ... Add more education details fields
            Divider(),
            Text(
              'Personal Details',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
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
    );
  }
}
class EditResumePage extends StatefulWidget {
  final DatabaseModel selectedResume;

  EditResumePage({required this.selectedResume});

  @override
  _EditResumePageState createState() => _EditResumePageState();
}

class _EditResumePageState extends State<EditResumePage> {
  // Create TextEditingController instances for each field to enable editing
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  // ... Create controllers for other fields

  @override
  void initState() {
    super.initState();
    // Set the initial values of the controllers to the selected resume's data
    nameController.text = widget.selectedResume.name;
    emailController.text = widget.selectedResume.email;
    // ... Set initial values for other controllers
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Resume'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              // Save the edited resume data here
              // For example, you can use the controllers' values to update the data
              // After saving, you can navigate back to the selected resume page
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),

          ],
        ),
      ),
    );
  }
}
