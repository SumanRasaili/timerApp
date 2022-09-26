import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData( 
        primarySwatch: Colors.teal,
        primaryColor: Colors.teal,
        backgroundColor: Colors.black,
        buttonTheme: ButtonThemeData( 
          disabledColor: Colors.red
        )
      ),
      title: 'Timer App',
      home:const  HomePage(),
    );
  }
}
