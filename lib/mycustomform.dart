import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCustomForm extends StatefulWidget{
  const MyCustomForm({super.key});
  @override
 State<MyCustomForm> createState()=>_MyCustomFormState();

  }
  class _MyCustomFormState extends State<MyCustomForm>{
    final myController=TextEditingController();
    @override
    void dispose(){
      myController.dispose();
      super.dispose();
    }
  @override
    Widget build(BuildContext context){
     return Scaffold();
  }
}