import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form/PersonalDetails.dart';
import 'package:form/adminportal.dart';
import 'package:form/firebase.dart';
import 'package:form/loginPage.dart';
import 'package:form/registrationdetails.dart';
import 'package:form/selecteddateregistrations.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:const FirebaseOptions(
    apiKey: "AIzaSyCw8yzXmeEXFOwjH1LSFJwHLi8dqG3BjkA",
    authDomain: "form-5d23b.firebaseapp.com",
    projectId: "form-5d23b",
    storageBucket: "form-5d23b.firebasestorage.app",
    messagingSenderId: "358754229411",
    appId: "1:358754229411:web:9dfba08f5485b9cb31b316",
    measurementId: "G-N6Y7YKGLY3")
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Form',

      theme: ThemeData(

      ),
      home: AdminPortal(),

    );
  }
  Widget inputField(){
    return const TextField(
      decoration: InputDecoration(
        label: Text("data"),

      ),
    );
  }
}