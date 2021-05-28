import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/LoginPage.dart';

import 'HomePage.dart';
import 'ProviderState/OTPProvider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  splashTimer() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool("isLoggedIn")?? false;
    Provider.of<OTPProvider>(context, listen: false).setLogin(isLoggedIn);

    if (isLoggedIn) {
      String mobileNo = prefs.getString("number");

      Provider.of<OTPProvider>(context, listen: false).setNumber(mobileNo);

      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPage()));
    }

    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  initState() {
    // TODO: implement initState
    splashTimer();
//    checkGpsStatus();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // SizedBox(height: 100,),
              Container(
                height: 140,
                width: 140,
                child: Center(
                    child: Image.asset(
                  "assets/Images/Img.png",
                  fit: BoxFit.cover,
                )),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Ionic Test App",
                style: TextStyle(
                    color: Colors.pink,
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 20,
              ),
              CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}
