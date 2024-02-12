import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provieder_todo/controller/homeCtr.dart';
import 'package:provieder_todo/pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (contex) => TodoController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: false),
        home: HomePage(),
      ),
    );
  }
}
