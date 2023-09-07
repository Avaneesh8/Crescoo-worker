// ignore_for_file: non_constant_identifier_names

class UserModel {
  String name;
  String gender;
  String age;
  String occupation;
  String years_of_experience;
  String phoneNumber;
  String uid;
  String per_hour;
  String per_day;
  String createdAt;

  UserModel({
    required this.name,
    required this.gender,
    required this.age,
    required this.occupation,
    required this.years_of_experience,
    required this.phoneNumber,
    required this.uid,
    required this.per_hour,
    required this.per_day,
    required this.createdAt,
  });

  // from map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      gender: map['gender'] ?? '',
      age: map['age'] ?? '',
      uid: map['uid'] ?? '',
      phoneNumber: map['phone Number'] ?? '',
      years_of_experience: map['years of experience'] ?? '',
      occupation: map['occupation']??'',
      per_hour: map['per hour']??'',
      per_day: map['per day']??'',
      createdAt :map['createdAt']??'',
    );
  }

  // to map
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "gender": gender,
      "uid": uid,
      "age": age,
      "years of experience": years_of_experience,
      "occupation": occupation,
      "phoneNumber": phoneNumber,
      "per hour":per_hour,
      "per day":per_day,
      "created At":createdAt
    };
  }
}
