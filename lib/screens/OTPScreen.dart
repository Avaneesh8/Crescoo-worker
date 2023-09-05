import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../widgets/Custom_Button.dart';
import '../widgets/SnackBar.dart';
import '../widgets/Top_part.dart';
import 'Home.dart';
import 'Login.dart';

class OTPScreen extends StatefulWidget {

  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String? otpCode;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            //color: Colors.white,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 25, horizontal: 30),
                child: Column(
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: .270 * MediaQuery.of(context).size.height,
                        child: const Top_part()),
                    SizedBox(height: MediaQuery.of(context).size.height*.13),
                    const Padding(
                      padding:
                      EdgeInsets.only(left: 35),
                      child: Text(
                        'Enter the OTP',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 1.63,
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*.05),
                    Pinput(
                      length: 6,
                      showCursor: true,
                      defaultPinTheme: PinTheme(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(

                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Color(0xFFCAC6C6)
                          ),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onCompleted: (value) {
                        setState(() {
                          otpCode = value;
                        });
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*.05),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Home()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(189, 189, 199, 1),
                              border: Border.all(
                                color: Color.fromRGBO(189, 189, 199, 1),
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(25))),
                          constraints: BoxConstraints(
                              minWidth: 200,
                              maxWidth: .5 * MediaQuery.of(context).size.width),
                          height: 50,
                          child: Center(
                              child: Text(
                                "Proceed",
                                style: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.w400,),
                              )),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*.1),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const Login()),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: Center(
                              child: Text(
                                "Already Signed up? Tap here to Login",
                                style: TextStyle(color: Colors.black, fontSize: 20),
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}
