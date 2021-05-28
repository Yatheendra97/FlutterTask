import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:task/LoginPage.dart';
import 'package:task/ProviderState/OTPProvider.dart';
import 'package:task/Utils/CustomDrawer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int value = 0;

  var darkBrown;

  var greyShade;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(1),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff3c6382),
        title: Text('Home page'),
        // centerTitle: true,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                size: 25,
                color: Colors.white,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.account_circle,
                size: 28,
              ),
              onPressed: () {})
        ],
      ),
      body: Container(
        child: Center(
          child: Text(
            'Welcome ' +
                Provider.of<OTPProvider>(context, listen: false).number,
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
