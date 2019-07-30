import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';

import 'models/user_model.dart';
import 'screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return ScopedModel<UserModel>(
      child: MaterialApp(
          title: 'Loja de roupas',
          theme: ThemeData(
              primarySwatch: Colors.blue, primaryColor: Colors.blueAccent),
          debugShowCheckedModeBanner: false,
          home: HomeScreen()),
      model: UserModel(),
    );
  }
}
