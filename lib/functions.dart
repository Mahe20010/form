import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:universal_html/html.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

import 'Details.dart';
Future<void> submitData(BuildContext context,Details detail) async{
  final url=Uri.parse("http://localhost:8080/api/registrations");
  final response=await http.post(url,
    headers: {"Content-Type":"application/json"},
    // body: jsonEncode(
    //   {
    //     "name": name,
    //     "email": email,
    //     "qualification": qualification,
    //     "phone": phone,
    //     "state": state,
    //     "district": district
    //   }
    // )
     body: jsonEncode(detail)
  );
  if(response.statusCode==200) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Submission successfull"),
      backgroundColor: Colors.green,
    )

    );
  }
  else {
    print("Error submitting data.");
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Submission Failed!"),
      backgroundColor: Colors.red,
    ));
  }

}
Future<List<Details>?> GetDataFromApi() async{
  final url="http://localhost:8080/api/registrations";
  List<Details>? data;
  try{
    final response=await http.get(Uri.parse(url));
    if(response.statusCode==200){
       List<dynamic> datas = jsonDecode(response.body);
       return datas.map((element)=>Details.fromJson(element)).toList();
    }

  }
  catch( e){
    print("Error: $e");
  }
 // return data;
}
List<Details>? getDateDetails(List<Details>? totalDetails){
  //final DateTime
  List<Details>? dateDetails=[];
  for(Details eachDetail in totalDetails!){
    String timeStamp=eachDetail.createdAt!;
    DateTime dateTime=DateTime.parse(timeStamp);
    String formated=DateFormat("dd-MM-yyyy").format(dateTime);
  }
return dateDetails;
}
