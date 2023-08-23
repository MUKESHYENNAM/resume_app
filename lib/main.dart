import 'package:flutter/material.dart';
import 'package:flutter_login_project/allResumes.dart';
import 'package:provider/provider.dart';
import 'Comm/Textheader.dart';
import 'modelData.dart';
import 'modelclass.dart';
import 'personalInfo.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PersonalInfoProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartFile(),
    );
  }
}

class StartFile extends StatefulWidget {
  @override
  _StartFileState createState() => _StartFileState();
}

class _StartFileState extends State<StartFile> {
  late List<DatabaseModel> insertedData = [];

  @override
  void initState() {
    super.initState();
    // Call fetchData and print the inserted data
    _printInsertedData();
  }

  Future<void> _printInsertedData() async {
    final dbHelper = DbHelper();
    insertedData = await dbHelper.fetchData();
    print('Number of Inserted Records: ${insertedData.length}');
    print('Inserted Data:');
    for (final data in insertedData) {
      print('Inserted: ${data.address}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 30,),
                textHeader('Hello There!'),
                SizedBox(height: 10,),
                Text(
                  "Creator Resume \n Content creation is currently one of the fastest-growing,\n if not the fastest-growing profession in the world.",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20,),
                Image.asset('assets/New Project.jpg'),
                SizedBox(height: 20,),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10.0),
                      width: double.infinity,
                      child: FlatButton(
                        child: Text(
                          'Create Resume',
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
                      width: double.infinity,
                      child: FlatButton(
                        child: Text(
                          'All Resumes',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => FetchedDataPage(fetchedData: insertedData),
                            ),
                          );
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
    );
  }
}
