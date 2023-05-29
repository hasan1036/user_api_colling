import 'package:flutter/material.dart';
import 'package:user_api2/home_page.dart';
import 'package:user_api2/rich_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       // primaryColor:Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //useMaterial3: true,
      ),
      home:RichText1(),
     // home: HomePage(),

    );
  }
}
