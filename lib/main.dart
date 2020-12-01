import 'package:app_restaurant/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//void main() => runApp(MyApp());

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations ( [DeviceOrientation.portraitUp] )
      .then ((_) {
    runApp (MyApp());
  });
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepOrangeAccent,
        scaffoldBackgroundColor: Colors.grey[50]
      ),
      home: Homescreen(),
    );
  }
}
