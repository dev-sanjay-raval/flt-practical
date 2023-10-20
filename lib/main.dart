import 'package:flutter/material.dart';
import 'package:i_genious/Helper/theme.dart';
import 'package:i_genious/UI/user_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //routerConfig: routeGenerator.router,
      title: "InGenius",
      theme: Themes.lightTheme(context),
      home: UserListScreen(),
    );
  }
}

