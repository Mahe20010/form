import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  State<LoginPage> createState() => _LoginPage();


}
   class _LoginPage extends State<LoginPage>{
  final _formKey=GlobalKey<FormState>();
  String phone="";
  final FirebaseAnalytics analytics=FirebaseAnalytics.instance;

  TextEditingController emailPhoneController=new TextEditingController();
  int? maxLength;

  TextEditingController passwordController  =new TextEditingController();
  @override
  void initState(){
    super.initState();
    analytics.logEvent(name: "app_oepned");
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: Text("Admin Login",
        ),
        centerTitle: true,
        backgroundColor: Colors.limeAccent,
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          alignment: Alignment.centerRight,
          margin: EdgeInsets.symmetric(vertical: 40,horizontal: 40),
          padding: EdgeInsets.symmetric(),
         // foregroundDecoration: Decoration.lerp(a, b, t),
          constraints: BoxConstraints(maxWidth: ((kIsWeb))?MediaQuery.of(context).size.width/2:MediaQuery.of(context).size.width),

          child: Form(
            key:_formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 140,horizontal: 100),
              child: Column(

                children: [
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child:  Text("Phone Number/Email",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,

                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(height:20),
                  TextFormField(
                    maxLength: (emailPhoneController.text.startsWith(RegExp(r"[0-9]")))?10:30,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    validator: (value){
                      if(value==null||value.isEmpty){
                        return "please enter phone number/email";
                      }
                      else if(value.startsWith(RegExp(r"\d"))&&value.length!=10){
                        return "phone number length will 10-10";
                      }
                      else if(value.contains(RegExp(r'[a-zA-Z\d_%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'))){
                        return "Enter a valid EMail Id";
                      }
                      else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      counterText: "${emailPhoneController.text.length}/30",
                      //counter: Text("${emailPhoneController.text.length}/90"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      )
                    ),
                  ),
                  const SizedBox(height: 30,),
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: Text("Password*",
                      textAlign: TextAlign.start,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                    ),
                  ),
                  TextFormField(
                    validator: (value){
                      if(value==null||value.isEmpty){
                        return "please enter password";
                      }
                      if(value.length<8){
                        return "m";
                      }
                    },
                    controller:passwordController ,
                    key: _formKey,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)
                      )
                    ),
                  ),
                  ElevatedButton(
                      onPressed: (){
                        if(_formKey.currentState!.validate()){

                        }
                      },
                      child: Text("Submit")
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}