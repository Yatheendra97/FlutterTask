import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/HomePage.dart';
import 'package:task/ProviderState/OTPProvider.dart';

final inputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8.0),
  borderSide: BorderSide(color: Colors.grey.shade400),
);

final inputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 16.0),
  border: inputBorder,
  focusedBorder: inputBorder,
  enabledBorder: inputBorder,
);

class OTPPage extends StatelessWidget {
  static final String path = "lib/src/pages/misc/otp.dart";
  final String otp = "1234";
  @override
  Widget build(BuildContext context) {
    var mobilenumber = Provider.of<OTPProvider>(context, listen: false).number;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30.0),
            Text(
              "Please enter the one time password received at your phone number ending " +
                  mobilenumber.substring(
                      Provider.of<OTPProvider>(context, listen: false)
                              .number
                              .length -
                          4),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 20.0),
            OTPFields(),
            const SizedBox(height: 20.0),
            Text(
              "Expiring in 02:22",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0, color: Colors.grey),
            ),
            const SizedBox(height: 10.0),
            TextButton(
              child: Text(
                "RESEND OTP",
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () {},
            ),
            const SizedBox(height: 30.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.pink,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                padding: const EdgeInsets.all(16.0),
                minimumSize: Size(200, 60),
              ),
              child: Text(
                "Confirm",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              onPressed: () async {
                Fluttertoast.showToast(
                    msg: "Login Success",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green[800],
                    textColor: Colors.white,
                    fontSize: 16.0);
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setBool("isLoggedIn", true);
                prefs.setString("number",
                    Provider.of<OTPProvider>(context, listen: false).number);
                Provider.of<OTPProvider>(context, listen: false).setLogin(true);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            )
          ],
        ),
      ),
    );
  }
}

class OTPFields extends StatefulWidget {
  const OTPFields({
    Key key,
  }) : super(key: key);

  @override
  _OTPFieldsState createState() => _OTPFieldsState();
}

class _OTPFieldsState extends State<OTPFields> {
  FocusNode pin2FN;
  FocusNode pin3FN;
  FocusNode pin4FN;
  final pinStyle = TextStyle(fontSize: 32, fontWeight: FontWeight.bold);

  @override
  void initState() {
    super.initState();
    pin2FN = FocusNode();
    pin3FN = FocusNode();
    pin4FN = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FN?.dispose();
    pin3FN?.dispose();
    pin4FN?.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 60,
                child: TextFormField(
                  autofocus: true,
                  style: pinStyle,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: inputDecoration,
                  onChanged: (value) {
                    nextField(value, pin2FN);
                  },
                ),
              ),
              SizedBox(
                width: 60,
                child: TextFormField(
                  focusNode: pin2FN,
                  style: pinStyle,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: inputDecoration,
                  onChanged: (value) => nextField(value, pin3FN),
                ),
              ),
              SizedBox(
                width: 60,
                child: TextFormField(
                  focusNode: pin3FN,
                  style: pinStyle,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: inputDecoration,
                  onChanged: (value) => nextField(value, pin4FN),
                ),
              ),
              SizedBox(
                width: 60,
                child: TextFormField(
                  focusNode: pin4FN,
                  style: pinStyle,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: inputDecoration,
                  onChanged: (value) {
                    if (value.length == 1) {
                      pin4FN.unfocus();
                    }
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
