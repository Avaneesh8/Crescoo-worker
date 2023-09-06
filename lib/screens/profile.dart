import 'package:flutter/material.dart';

import '../widgets/top_part_white.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: .270 * MediaQuery.of(context).size.height,
                child: const Top_part_white()),
            SizedBox(height: MediaQuery.of(context).size.height*.08),
            Container(
              width: MediaQuery.of(context).size.width*.8,
              height: MediaQuery.of(context).size.height*.3,
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
            )
          ],
        ),
      ),
    );
  }
}
