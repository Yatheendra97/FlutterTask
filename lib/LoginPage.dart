import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:task/HomePage.dart';
import 'package:task/OTPPage.dart';
import 'package:task/ProviderState/OTPProvider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List<String> mobileNumber = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController pswController = TextEditingController();
  TextEditingController usrController = TextEditingController();
  bool enableButton = false;
  bool _autoValidate;
  // var maskFormatter =  MaskTextInputFormatter(
  //     mask: 'xxxxx-xxxxx', filter: {"x": RegExp(r'[0-9]')});
  var maskFormatter = new MaskTextInputFormatter(
      mask: '#####-#####', filter: {"#": RegExp(r'[0-9]')});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff3c6382),
        title: Text('Ionic Test App'),
      ),
      body: Container(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    //  height: 50,
                    height: MediaQuery.of(context).size.height / 5.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login with your Mobile Number ',
                          // textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    title: TextFormField(
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.go,
                      controller: usrController,
                      inputFormatters: [maskFormatter],
                      onChanged: (content) {
                        if (content.length > 10) {
                          setState(() {
                            enableButton = true;
                          });
                        } else {
                          setState(() {
                            enableButton = false;
                          });
                        }
                      },
                      decoration: InputDecoration(
//                      hintStyle: TextStyle(fontSize: 12),
                        labelText: 'Mobile Number',
                        prefixIcon: const Icon(
                          Icons.call,
//                              color: Colors.purple,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                if (enableButton) {
                  Provider.of<OTPProvider>(context, listen: false)
                      .setNumber(usrController.text);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OTPPage()));
                }
              },
              child: Container(
                // height: 60,
                height: MediaQuery.of(context).size.width / 6,
                width: MediaQuery.of(context).size.width * .6,

                child: Center(
                    child: Text(
                  "Next",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      fontSize: 18),
                )),
                decoration: BoxDecoration(
                  color: enableButton ? Colors.pink : Colors.grey.shade700,
                  borderRadius: BorderRadius.circular(30),
                  // border: Border.all(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
