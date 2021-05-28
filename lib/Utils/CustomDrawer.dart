import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:task/LoginPage.dart';
import 'package:task/ProviderState/OTPProvider.dart';

class CustomDrawer extends StatefulWidget {
  int code;
  CustomDrawer(this.code);
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  Color greyColor = Colors.grey;
  Color lightWhite = Colors.white54;
  Color tileColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        // width: MediaQuery.of(context).size.width * 0.85,//20.0,

        child: Drawer(
            child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  color: Color(0xff3c6382),
                  width: double.infinity,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 50,
                              width: 50,
                              // child: Icon(Icons.supervised_user_circle),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage("assets/Images/Bike.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Hello Yatheendra",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )
                          ],
                        ),
                      )),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  leading: Icon(
                    Icons.home,
                    color: Colors.pink,
                  ),
                  title: Text(
                    'Home',
                  ),
                ),
                ListTile(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Are you sure ?"),
                            content: Text("Do you want to exit an App"),
                            actions: <Widget>[
                              FlatButton(
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(color: Colors.black),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              FlatButton(
                                child: Text(
                                  "LogOut",
                                  style: TextStyle(color: Colors.red),
                                ),
                                onPressed: () {
                                  Provider.of<OTPProvider>(context,
                                          listen: false)
                                      .setLogin(false);
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()),
                                      (Route<dynamic> route) => false);
                                  Fluttertoast.showToast(
                                      msg: "You’ve been Logged Out!”.",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.pink,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                },
                              ),
                            ],
                          );
                        });
                  },
                  leading: Icon(
                    Icons.power_settings_new,
                    color: Colors.pink,
                  ),
                  title: Text(
                    'LogOut',
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
