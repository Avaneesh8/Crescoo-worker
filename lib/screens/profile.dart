import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crescoo/screens/SplashScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../model/user_model.dart';
import '../provider/auth_provider.dart';
import '../widgets/Top_part.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _experienceController = TextEditingController();
  TextEditingController _perHourController = TextEditingController();
  TextEditingController _perDayController = TextEditingController();
  String _selectedCity = "Mumbai"; // Default city selection
  bool _isEditing = false; // Flag to track if editing mode is enabled

  // List of cities for the dropdown menu
  final List<String> cities = [
    "Mumbai",
    "Delhi",
    "Bangalore",
    "Hyderabad",
    "Chennai",
    "Kolkata",
    "Pune",
  ];

  final List<String> occupation = [
    'Carpentry',
    'Cleaning',
    'Blacksmith',
    'Electrical',
    'Plumbing',
    'Movers',
  ]; // Add your list of cities here
  String _occupationselection = "Carpentry";

  @override
  void dispose() {
    _genderController.dispose();
    _ageController.dispose();
    _experienceController.dispose();
    _perHourController.dispose();
    _perDayController.dispose();
    _nameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    final ap = Provider.of<AuthProvider>(context, listen: false);
    _occupationselection=ap.userModel.occupation;
    _genderController.text=ap.userModel.gender;
    _ageController.text=ap.userModel.age;
    _experienceController.text=ap.userModel.years_of_experience;
    _selectedCity=ap.userModel.city;
    _perHourController.text=ap.userModel.per_hour;
    _perDayController.text=ap.userModel.per_day;
    _nameController.text=ap.userModel.name;
    _phoneNumberController.text=ap.userModel.phoneNumber;
  }
  void _toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  Future<void> _saveChanges() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    // Get the edited values from controllers
    String editedName = _nameController.text;
    String editedGender = _genderController.text;
    String editedAge = _ageController.text;
    String editedExperience = _experienceController.text;
    String editedPerHour = _perHourController.text;
    String editedPerDay = _perDayController.text;

    // Update the userModel with the edited values
    ap.userModel.name = editedName;
    ap.userModel.occupation = _occupationselection;
    ap.userModel.gender = editedGender;
    ap.userModel.age = editedAge;
    ap.userModel.years_of_experience = editedExperience;
    ap.userModel.per_hour = editedPerHour;
    ap.userModel.per_day = editedPerDay;
    ap.userModel.city = _selectedCity; // Update the selected city

    try {
      // Update the user data in Firestore
      await FirebaseFirestore.instance
          .collection('workers') // Change to your Firestore collection name
          .doc(_firebaseAuth.currentUser!
          .uid) // Assuming userId uniquely identifies the user document
          .update({
        'name': editedName,
        'gender': editedGender,
        'age': editedAge,
        'years of experience': editedExperience,
        'occupation': _occupationselection,
        'per hour': editedPerHour,
        'per day': editedPerDay,
        'city': _selectedCity,// Update the city in Firestore
      });

      // Exit edit mode
      _toggleEdit();
    } catch (e) {
      // Handle errors here, e.g., show an error message
      print('Error updating user data: $e');
    }
  }
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    final userModel = ap.userModel;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            (MediaQuery.of(context).size.height*.06).heightBox,
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: .200 * MediaQuery.of(context).size.height,
              child: const Top_part(),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .04),
            Container(
              width: MediaQuery.of(context).size.width * .85,
              height: MediaQuery.of(context).size.height * .45,
              decoration: ShapeDecoration(
                color: Color(0xFFE0DEDE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(10, 10),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 35, right: 35, top: 10, bottom: 10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Details",
                            style: TextStyle(
                              fontSize: 35,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          _isEditing
                              ? IconButton(
                            icon: Icon(Icons.save),
                            onPressed: _saveChanges,
                          )
                              : IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: _toggleEdit,
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        constraints: BoxConstraints(
                          maxWidth: 400.0,
                        ),
                        child: TextFormField(
                          controller: _nameController,
                          readOnly: !_isEditing,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            labelStyle: TextStyle(
                              color: Color.fromRGBO(26, 50, 81, 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(26, 50, 81, 1),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(26, 50, 81, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        constraints: BoxConstraints(
                          maxWidth: 400.0,
                        ),
                        child: TextFormField(
                          controller: _genderController,
                          readOnly: !_isEditing,
                          decoration: InputDecoration(
                            labelText: 'Gender',
                            labelStyle: TextStyle(
                              color: Color.fromRGBO(26, 50, 81, 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(26, 50, 81, 1),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(26, 50, 81, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        constraints: BoxConstraints(
                          maxWidth: 400.0,
                        ),
                        child: TextFormField(
                          controller: _ageController,
                          readOnly: !_isEditing,
                          decoration: InputDecoration(
                            labelText: 'Age',
                            labelStyle: TextStyle(
                              color: Color.fromRGBO(26, 50, 81, 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(26, 50, 81, 1),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(26, 50, 81, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        constraints: BoxConstraints(
                          maxWidth: 400.0,
                        ),
                        child: TextFormField(
                          controller: _phoneNumberController,
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            labelStyle: TextStyle(
                              color: Color.fromRGBO(26, 50, 81, 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(26, 50, 81, 1),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(26, 50, 81, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      _isEditing
                          ? Container(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        constraints: BoxConstraints(
                          maxWidth: 400.0,
                        ),
                        child: DropdownButtonFormField<String>(
                          value: _occupationselection,
                          items: occupation.map((city) {
                            return DropdownMenuItem<String>(
                              value: city,
                              child: Text(city),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _occupationselection = value!;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'Occupation',
                            labelStyle: TextStyle(
                              color: Color.fromRGBO(26, 50, 81, 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(26, 50, 81, 1),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(26, 50, 81, 1),
                              ),
                            ),
                          ),
                        ),
                      )
                          : Container(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        constraints: BoxConstraints(
                          maxWidth: 400.0,
                        ),
                        child: TextFormField(
                          controller: TextEditingController(text: _occupationselection),
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: 'Occupation',
                            labelStyle: TextStyle(
                              color: Color.fromRGBO(26, 50, 81, 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(26, 50, 81, 1),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(26, 50, 81, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        constraints: BoxConstraints(
                          maxWidth: 400.0,
                        ),
                        child: TextFormField(
                          controller: _experienceController,
                          readOnly: !_isEditing,
                          decoration: InputDecoration(
                            labelText: 'Experience',
                            labelStyle: TextStyle(
                              color: Color.fromRGBO(26, 50, 81, 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(26, 50, 81, 1),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(26, 50, 81, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      _isEditing
                          ? Container(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        constraints: BoxConstraints(
                          maxWidth: 400.0,
                        ),
                        child: DropdownButtonFormField<String>(
                          value: _selectedCity,
                          items: cities.map((city) {
                            return DropdownMenuItem<String>(
                              value: city,
                              child: Text(city),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedCity = value!;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'City',
                            labelStyle: TextStyle(
                              color: Color.fromRGBO(26, 50, 81, 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(26, 50, 81, 1),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(26, 50, 81, 1),
                              ),
                            ),
                          ),
                        ),
                      )
                          : Container(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        constraints: BoxConstraints(
                          maxWidth: 400.0,
                        ),
                        child: TextFormField(
                          controller: TextEditingController(text: _selectedCity),
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: 'City',
                            labelStyle: TextStyle(
                              color: Color.fromRGBO(26, 50, 81, 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(26, 50, 81, 1),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(26, 50, 81, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        constraints: BoxConstraints(
                          maxWidth: 400.0,
                        ),
                        child: TextFormField(
                          controller: _perHourController,
                          readOnly: !_isEditing,
                          decoration: InputDecoration(
                            labelText: 'Per Hour',
                            labelStyle: TextStyle(
                              color: Color.fromRGBO(26, 50, 81, 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(26, 50, 81, 1),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(26, 50, 81, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        constraints: BoxConstraints(
                          maxWidth: 400.0,
                        ),
                        child: TextFormField(
                          controller: _perDayController,
                          readOnly: !_isEditing,
                          decoration: InputDecoration(
                            labelText: 'Per Day',
                            labelStyle: TextStyle(
                              color: Color.fromRGBO(26, 50, 81, 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(26, 50, 81, 1),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(26, 50, 81, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            (.02 * MediaQuery.of(context).size.height).heightBox,
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () {
                  ap.userSignOut().then(
                        (value) => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SplashScreen(),
                      ),
                          (Route<dynamic> route) => false,
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(26, 50, 81, 1),
                    border: Border.all(
                      color: Color.fromRGBO(26, 50, 81, 1),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 200,
                    maxWidth: .5 * MediaQuery.of(context).size.width,
                  ),
                  height: 50,
                  child: Center(
                    child: Text(
                      'Log Out',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
