class DatabaseModel {
  final String dob;
  final String nationality;
  final String gender;
  final String languages;
  final String maritalStatus;

  final String name;
  final String email;
  final String address;
  final String mobileNo;
  final String linkedInUrl;
  final String yourSelf;
  final String progLanguage;
  final String currentlyWorking;
  final String skills;
  final String hobbies;
  final String courses;
  final String degree;
  final String schoolOrCollege;
  final String percentage;
  final String roleTraining;
  final String companyTraining;

  DatabaseModel({
    required this.dob,
    required this.nationality,
    required this.gender,
    required this.languages,
    required this.maritalStatus,
    required this.name,
    required this.email,
    required this.address,
    required this.mobileNo,
    required this.linkedInUrl,
    required this.yourSelf,
    required this.progLanguage,
    required this.currentlyWorking,
    required this.skills,
    required this.hobbies,
    required this.courses,
    required this.degree,
    required this.schoolOrCollege,
    required this.percentage,
    required this.roleTraining,
    required this.companyTraining,
  });

  Map<String, dynamic> toMap() {
    return {
      'dob': dob,
      'nationality': nationality,
      'gender': gender,
      'languages': languages,
      'maritalStatus': maritalStatus,
      'name': name,
      'email': email,
      'address': address,
      'mobileNo': mobileNo,
      'linkedInUrl': linkedInUrl,
      'yourSelf': yourSelf,
      'progLanguage': progLanguage,
      'currentlyWorking': currentlyWorking,
      'skills': skills,
      'hobbies': hobbies,
      'courses': courses,
      'degree': degree,
      'schoolOrCollege': schoolOrCollege,
      'percentage': percentage,
      'roleTraining': roleTraining,
      'companyTraining': companyTraining,
    };
  }
}
