import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';

import 'modelData.dart';


class DbHelper {
  static Database? _db;

  static const String DB_Name = 'ResumData.db';
  static const String Table_User = 'allCondidates';
  static const int Version = 1;

  static final cId = 'id';

  static const String dob = 'dob';
  static const String nationality = 'nationality';
  static const String gender = 'gender';
  static const String languages = 'languages';
  static const String maritalStatus = 'maritalStatus';
  static const String name = 'name';
  static const String email = 'email';
  static const String address = 'address';
  static const String mobileNo = 'mobileNo';
  static const String linkedInUrl = 'linkedInUrl';
  static const String yourSelf = 'yourSelf';
  static const String progLanguage = 'progLanguage';
  static const String currentlyWorking = 'currentlyWorking';
  static const String skills = 'skills';
  static const String hobbies = 'hobbies';
  static const String courses = 'courses';
  static const String degree = 'degree';
  static const String schoolOrCollege = 'schoolOrCollege';
  static const String percentage = 'percentage';
  static const String roleTraining = 'roleTraining';
  static const String companyTraining = 'companyTraining';


  Future<Database> get db async {
    return _db = await initDb();
  }

  initDb() async {
    Directory documentdirectory = await getApplicationDocumentsDirectory();
    String path = join(documentdirectory.path, DB_Name);
    print("path:::${path}");
    var db = await openDatabase(path, version: Version, onCreate: _onCreate);
    return db;
  }


  Future _onCreate(Database db, int version)async{
    await db.execute(
        '''
       CREATE TABLE $Table_User(
            $cId INTEGER PRIMARY KEY,
            $dob TEXT NOT NULL,
            $nationality TEXT NOT NULL,
            $gender TEXT NOT NULL,
            $languages TEXT NOT NULL,
            $maritalStatus TEXT NOT NULL,
            $name TEXT NOT NULL,
            $email TEXT NOT NULL,
            $address TEXT NOT NULL,
            $mobileNo TEXT NOT NULL,
            $linkedInUrl TEXT NOT NULL,
            $yourSelf TEXT NOT NULL,
            $progLanguage TEXT NOT NULL,
            $currentlyWorking TEXT NOT NULL,
            $skills TEXT NOT NULL,
            $hobbies TEXT NOT NULL,
            $courses TEXT NOT NULL,
            $degree TEXT NOT NULL,
            $schoolOrCollege TEXT NOT NULL,
            $percentage TEXT NOT NULL,
            $roleTraining TEXT NOT NULL,
            $companyTraining TEXT NOT NULL
            )
      '''
    );

  }

  // // Future<int> saveData(UserModel user) async {
  // //   var dbClient = await db;
  // //   var res = await dbClient.insert(Table_User, user.toMap());
  // //   return res;
  // // }

  Future<void> insertData(DatabaseModel data) async {
    print("row1::");
    Database db = await this.db;
    print("row:::::${data}");
    await db.insert(Table_User, data.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
  Future<List<DatabaseModel>> fetchData() async {
    Database db = await this.db;
    final List<Map<String, dynamic>> maps = await db.query(Table_User);
    return List.generate(maps.length, (i) {
      return DatabaseModel(
        dob: maps[i]['dob'],
        nationality: maps[i]['nationality'],
        gender: maps[i]['gender'],
        languages: maps[i]['languages'],
        maritalStatus: maps[i]['maritalStatus'],
        name: maps[i]['name'],
        email: maps[i]['email'],
        address: maps[i]['address'],
        mobileNo: maps[i]['mobileNo'],
        linkedInUrl: maps[i]['linkedInUrl'],
        yourSelf: maps[i]['yourSelf'],
        progLanguage: maps[i]['progLanguage'],
        currentlyWorking: maps[i]['currentlyWorking'],
        skills: maps[i]['skills'],
        hobbies: maps[i]['hobbies'],
        courses: maps[i]['courses'],
        degree: maps[i]['degree'],
        schoolOrCollege: maps[i]['schoolOrCollege'],
        percentage: maps[i]['percentage'],
        roleTraining: maps[i]['roleTraining'],
        companyTraining: maps[i]['companyTraining'],
      );
    });
  }
  // Future<List<Map<String, dynamic>>> query() async{
  //   Database db = await this.db;
  //   return await db.query(Table_User);
  // }
  // Future<int> deleteAllRecords() async {
  //   var dbClient = await db;
  //   return await dbClient.delete(Table_User);
  // }
  //
  // Future<bool> getLoginUser(String emailId, String password) async {
  //   Database db = await this.db;
  //   var result = await db.rawQuery(
  //       "SELECT * FROM $Table_User WHERE "
  //           "$C_Email = '$emailId' AND "
  //           "$C_Password = '$password'");
  //   print("res::${result}");
  //   // int? exists = Sqflite.firstIntValue(result);
  //   if(result.isNotEmpty){
  //     return true;
  //   }else{
  //     return false;
  //   }
  // }
  //
  // Future<int> updateUser(UserModel user) async {
  //   var dbClient = await db;
  //   var res = await dbClient.update(Table_User, user.toMap(),
  //       where: '$C_FirstName = ?', whereArgs: [user.firstName]);
  //   return res;
  // }
  //
  // Future<int> deleteUser(String user_id) async {
  //   var dbClient = await db;
  //   var res = await dbClient
  //       .delete(Table_User, where: '$C_FirstName = ?', whereArgs: [user_id]);
  //   return res;
  // }
}
