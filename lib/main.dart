import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/ProviderState/OTPProvider.dart';
import 'package:task/SplashScreen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => OTPProvider()),
      ChangeNotifierProvider(create: (_) => OTPProvider())
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter App",
      home: SplashScreen(),
    ),
  ));
}
