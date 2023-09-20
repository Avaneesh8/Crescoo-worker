import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';
import '../widgets/NavBar.dart';
import '../widgets/Top_part.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
  }
  Future<void> updateDataInFirebase() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

    try {
      // Update the user data in Firestore
      await FirebaseFirestore.instance
          .collection('workers') // Change to your Firestore collection name
          .doc(_firebaseAuth.currentUser!
          .uid) // Assuming userId uniquely identifies the user document
          .update({
        'work_address':'',
        'booked':'',
        'work_owner_name':'',
        'work_phonenumber':'',
        'status':'not working',
      });
    } catch (e) {
      // Handle errors here, e.g., show an error message
      print('Error updating user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return ap.userModel.status=='working'?Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: .200 * MediaQuery.of(context).size.height,
            child: const Top_part(),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*.05), // Add spacing between the Switch and the new container
          Container(
            width: MediaQuery.of(context).size.width * .85,
            height: MediaQuery.of(context).size.height * .30,
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
              padding: const EdgeInsets.only(left: 35, right: 35, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ap.userModel.work_owner_name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ), // Add spacing between items
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ap.userModel.work_address,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ), // Add spacing between items
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ap.userModel.phoneNumber,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ), // Add spacing between items
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ap.userModel.booked,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: GestureDetector(
              onTap: () {
                updateDataInFirebase();
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(26, 50, 81, 1),
                    border: Border.all(
                      color: Color.fromRGBO(26, 50, 81, 1),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                width: 250,
                height: 50,
                child: Center(
                    child: Text(
                      "Done",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    )),
              ),
            ),
          ),
        ],
      ),
    ):Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: .200 * MediaQuery.of(context).size.height,
              child: const Top_part(),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.08),
            Text('No jobs are there currently'),
          ],
        ),
      ),
    );
  }

}
