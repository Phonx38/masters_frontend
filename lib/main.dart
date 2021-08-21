import 'package:flutter/material.dart';
import 'package:gst_app/api/api.dart';
import 'package:gst_app/screens/Homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GSTProvider>(
      create: (context)=>GSTProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          
          primarySwatch: Colors.blue,
        ),
        home: HomePage()
      ),
    );
  }
}
