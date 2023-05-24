import 'dart:io';

import 'package:flutter/material.dart';
import 'Store_Screens/Login.dart';
import 'Store_Screens/SplashScreen.dart';

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UserName And Password Login',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        // ignore: prefer_const_constructors
        '/': (context) => SplashScreen(),
        '/login': (context) => const LoginScreen(),
        // '/home': (context) => const HomeScreen(),
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
