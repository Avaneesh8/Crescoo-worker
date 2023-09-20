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
  String city;
  String status;
  String work_owner_name;
  String work_address;
  String work_phonenumber;
  String booked;

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
    required this.city,
    required this.status,
    required this.work_address,
    required this.work_owner_name,
    required this.work_phonenumber,
    required this.booked,
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
      occupation: map['occupation'] ?? '',
      per_hour: map['per hour'] ?? '',
      per_day: map['per day'] ?? '',
      createdAt: map['createdAt'] ?? '',
      city: map['city'] ?? '',
      status: map['status'] ?? '',
      work_address: map['work_address'] ?? '',
      work_owner_name: map['work_owner_name'] ?? '',
      work_phonenumber: map['work_phonenumber'] ?? '',
      booked: map['booked'] ?? '',
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
      "per hour": per_hour,
      "per day": per_day,
      "created At": createdAt,
      "city": city,
      "status": status,
      "work_address": work_address,
      "work_owner_name": work_owner_name,
      "work_phonenumber": work_phonenumber,
      "booked":booked,
    };
  }
}
