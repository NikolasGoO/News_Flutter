import 'package:flutter/material.dart';
import 'screens/news_home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom News',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: NewsHomeScreen(),
    );
  }
}
