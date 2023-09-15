import 'package:crescoo/screens/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';
import '../widgets/Top_part.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: .200 * MediaQuery.of(context).size.height,
                    child: const Top_part()),
                SizedBox(height: MediaQuery.of(context).size.height * .08),
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
                  child: Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(55.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Employee",
                                style: TextStyle(
                                  fontSize: 35,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              Icon(Icons.edit),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 35),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  ap.userModel.occupation,
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  ap.userModel.gender,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 35),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  ap.userModel.phoneNumber,
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  ap.userModel.age,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 35),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  ap.userModel.years_of_experience,
                                  style: TextStyle(fontSize: 55),
                                ),
                                Text(
                                  "Years of Experience",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(fontSize: 25),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 35),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Per Hour:${ap.userModel.per_hour}",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  "Per Day:${ap.userModel.per_day}",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
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
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromRGBO(26, 50, 81, 1),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                  child: Text('Log Out', style: const TextStyle(fontSize: 16)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
