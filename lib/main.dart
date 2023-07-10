import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo/home/home_screen.dart';
import 'package:todo/sceers/update_task.dart';
import 'package:todo/shared/styles/my_theme.dart';

import 'firebase_options.dart';

void main()async{
  //await FirebaseFirestore.instance.disableNetwork();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:HomeScreen.routName ,
      routes: {
    HomeScreen.routName:(context)=>HomeScreen(),
        UpdateTask.routName:(context)=>UpdateTask(),

      },
      themeMode:ThemeMode.light,
      theme: MyThemeData.lightTheme,

    );
  }
}
