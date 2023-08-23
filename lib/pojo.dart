class PersonalInformation {
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

  final String dob;
  final String nationality;
  final String gender;
  final String languages;
  final String maritalStatus;



  PersonalInformation({
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

    required this.dob,
    required this.nationality,
    required this.gender,
    required this.languages,
    required this.maritalStatus,
  });

  PersonalInformation copyWith({
    String? name,
    String? email,
    String? address,
    String? mobileNo,
    String? linkedInUrl,
    String? yourSelf,
    String? progLanguage,
    String? currentlyWorking,
    String? skills,
    String? hobbies,
    String? courses,
    String? degree,
    String? schoolOrCollege,
    String? percentage,
    String? roleTraining,
    String? companyTraining,

    String? dob,
    String? nationality,
    String? gender,
    String? languages,
    String? maritalStatus,
  }) {
    return PersonalInformation(
      name: name ?? this.name,
      email: email ?? this.email,
      address: address ?? this.address,
      mobileNo: mobileNo ?? this.mobileNo,
      linkedInUrl: linkedInUrl ?? this.linkedInUrl,
      yourSelf: yourSelf ?? this.yourSelf,
      progLanguage: progLanguage ?? this.progLanguage,
      currentlyWorking: currentlyWorking ?? this.currentlyWorking,
      skills: skills ?? this.skills,
      hobbies: hobbies ?? this.hobbies,
      courses: courses ?? this.courses,
      degree: degree ?? this.degree,
      schoolOrCollege: schoolOrCollege ?? this.schoolOrCollege,
      percentage: percentage ?? this.percentage,
      roleTraining: roleTraining ?? this.roleTraining,
      companyTraining: companyTraining ?? this.companyTraining,

      dob: dob ?? this.dob,
      nationality: nationality ?? this.nationality,
      gender: gender ?? this.gender,
      languages: languages ?? this.languages,
      maritalStatus: maritalStatus ?? this.maritalStatus,
    );
  }
}
