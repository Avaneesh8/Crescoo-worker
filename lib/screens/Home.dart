import 'package:flutter/material.dart';

import '../widgets/NavBar.dart';
import '../widgets/Top_part.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: .270 * MediaQuery.of(context).size.height,
              child: const Top_part()),
          SizedBox(height: MediaQuery.of(context).size.height*.08),
          const Padding(
            padding:
            EdgeInsets.only(left: 35),
            child: Text(
              'CAB has booked you, do you want to continue',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 1.63,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0), // Adjust as needed
            topRight: Radius.circular(40.0), // Adjust as needed
          ),
          color: Colors.blue,
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          backgroundColor: Colors.transparent, // Make the background transparent
          type: BottomNavigationBarType.fixed,
          onTap: ((value) {
            setState(() {
              _currentIndex = value;
            });
          }),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Color(0xFF1A3251)),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Color(0xFF1A3251)),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
