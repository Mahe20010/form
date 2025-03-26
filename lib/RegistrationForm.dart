import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form/EducationalQualification.dart';
import 'package:form/PersonalDetails.dart';

class RegistrationForm extends StatefulWidget{
  RegistrationForm({super.key});
  State<RegistrationForm> createState()=>_RegistrationForm();

}
class _RegistrationForm extends State<RegistrationForm>{


  @override
  Widget build(BuildContext context){


    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Registration Form"),
      // ),
      body: SingleChildScrollView(
        child: Container(
          child:
          Column(
            children: [
              PersonalDetails(),
           //   EducationQualification(),
        
            ],
          ),
        ),
      ),
    );
  }
}