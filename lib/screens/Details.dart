import 'package:crescoo/screens/OTPScreen.dart';
import 'package:crescoo/screens/authentication/Login.dart';
import 'package:crescoo/widgets/NavBar.dart';
import 'package:crescoo/widgets/Top_part.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/user_model.dart';
import '../provider/auth_provider.dart';
import 'Home.dart';

class Details extends StatefulWidget {
  final String name;
  final String age;
  final String gender;
  const Details(
      {Key? key, required this.name, required this.age, required this.gender})
      : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final TextEditingController Occupation = TextEditingController();
  final TextEditingController Years_of_experience = TextEditingController();
  final TextEditingController per_hour = TextEditingController();
  final TextEditingController per_day = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Occupation.selection = TextSelection.fromPosition(
      TextPosition(
        offset: Occupation.text.length,
      ),
    );
    Years_of_experience.selection = TextSelection.fromPosition(
      TextPosition(
        offset: Years_of_experience.text.length,
      ),
    );
    per_hour.selection = TextSelection.fromPosition(
      TextPosition(
        offset: per_hour.text.length,
      ),
    );
    per_day.selection = TextSelection.fromPosition(
      TextPosition(
        offset: per_day.text.length,
      ),
    );
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(children: [
          Column(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: .200 * MediaQuery.of(context).size.height,
                  child: const Top_part()),
              SizedBox(
                width: .25 * MediaQuery.of(context).size.width,
                height: .1 * MediaQuery.of(context).size.height,
                child: const FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Details',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
                child: TextFormField(
                  cursorColor: Colors.black,
                  controller: Occupation,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  onChanged: (value) {
                    setState(() {
                      Occupation.text = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Occupation",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.grey.shade600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
                child: TextFormField(
                  cursorColor: Colors.black,
                  controller: Years_of_experience,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  onChanged: (value) {
                    setState(() {
                      Years_of_experience.text = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Years Of Experience",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.grey.shade600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                  ),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 45),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('Your Pay Info:',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        )),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 35),
                    child: Container(
                      width: MediaQuery.of(context).size.width * .3,
                      child: TextFormField(
                        cursorColor: Colors.black,
                        controller: per_hour,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        onChanged: (value) {
                          setState(() {
                            per_hour.text = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Per Hour",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.grey.shade600,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.black12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.black12),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 35),
                    child: Container(
                      width: MediaQuery.of(context).size.width * .3,
                      child: TextFormField(
                        cursorColor: Colors.black,
                        controller: per_day,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        onChanged: (value) {
                          setState(() {
                            per_day.text = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Per Day",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.grey.shade600,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.black12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.black12),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  onTap: ()=>storeData(),
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(189, 189, 199, 1),
                        border: Border.all(
                          color: const Color.fromRGBO(189, 189, 199, 1),
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25))),
                    constraints: BoxConstraints(
                        minWidth: 200,
                        maxWidth: .5 * MediaQuery.of(context).size.width),
                    height: 50,
                    child: const Center(
                        child: Text(
                      "Proceed",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  void storeData() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    UserModel userModel = UserModel(
      name: widget.name.trim(),
      createdAt: "",
      phoneNumber: "",
      uid: "",
      gender: widget.gender.trim(),
      age: widget.age.trim(),
      occupation: Occupation.text.trim(),
      years_of_experience: Years_of_experience.text.trim(),
      per_hour: per_hour.text.trim(),
      per_day: per_day.text.trim(),
    );
    ap.saveUserDataToFirebase(
      context: context,
      userModel: userModel,
      onSuccess: () {
        ap.saveUserDataToSP().then(
              (value) => ap.setSignIn().then(
                    (value) => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NavBar(),
                        ),
                        (route) => false),
                  ),
            );
      },
    );
  }
}
