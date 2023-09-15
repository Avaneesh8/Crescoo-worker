import 'package:crescoo/screens/SignUp.dart';
import 'package:crescoo/widgets/NavBar.dart';
import 'package:flutter/material.dart';

import 'Login.dart';

class MinimalistLogin extends StatelessWidget {
  const MinimalistLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          color: Color.fromRGBO(253, 253, 253, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(width: 150, image: AssetImage('images/CrescooLogoBlue.png')),
              Text(
                "Crescoo\nWorkers",
                style: TextStyle(
                  color: Color.fromRGBO(26, 50, 81, 1),
                  fontSize: 35,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.1),
              const Text(
                "Let's get started",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Never a better time than now to start.",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black38,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.03),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(26, 50, 81, 1),
                      border: Border.all(
                        color: Color.fromRGBO(26, 50, 81, 1),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(25))
                  ),
                  width: 250,
                  height: 50,
                  child: Center(child: Text("Get Started",style: TextStyle(color: Colors.white,fontSize: 30),)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
