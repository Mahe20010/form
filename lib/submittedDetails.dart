import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form/Details.dart';

class SubmittedDetails extends StatelessWidget{
  Details details;
  int count;
  SubmittedDetails({required this.details,required this.count}) {}
    // Details details=Details();
    //  Details mahendra = Details(
    //    name: "Mahendra",
    //    email: "mahendra@example.com",
    //    phone: "9876543210",
    //    college: "XYZ University",
    //    gpa: "8.5",
    //    latestEducation: "B.Tech",
    //    State: "Andhra Pradesh",
    //    district: "Kurnool",
    //    gender: "Male",
    //    skills: "Flutter, Java, Python",
    //  );
    //  Details anil = Details(
    //    name: "Anil",
    //    email: "anil@example.com",
    //    phone: "9876543222",
    //    college: "ABC Institute",
    //    gpa: "8.0",
    //    latestEducation: "B.Sc",
    //    State: "Telangana",
    //    district: "Hyderabad",
    //    gender: "Male",
    //    skills: "Java, Spring Boot",
    //  );
//  List<Details> users = [mahendra, anil];
    // String name=deta
    @override
    Widget build(BuildContext context) {
      //  Map<String,dynamic>? data=details.toJson();
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("count${count+1}",style: TextStyle(color: Colors.blueAccent),),
                      SizedBox(width: 30,),
                      Expanded(
                        child:
                        Table(children: [
                          TableRow(
                              children: [
                                Text("Name",),
                                Text(":"),
                                Text(details.name==null?"Na":details.name!)
                              ]
                          ),
                          TableRow(
                              children: [
                                Text("Phone Number",),
                                Text(":"),
                                Text(details.phone==null?"na":details.phone!)
                              ]
                          ),
                          TableRow(
                              children: [
                                Text("Email",),
                                Text(":"),
                                Text(details.email==null?"LA":details.email!)
                              ]
                          ),
                          TableRow(
                              children: [
                                Text("Highest Education",),
                                Text(":"),
                                Text(details.latestEducation==null?"MA":details.latestEducation!)
                              ]
                          ),
                          TableRow(
                              children: [
                                Text("College",),
                                Text(":"),
                                Text(details.college==null?"college":details.college!)
                              ]
                          ),
                          TableRow(
                              children: [
                                Text("CGPA",),
                                Text(":"),
                                Text(details.gpa==null?"gpa":details.gpa!)
                              ]
                          )
                        ]
                        ),

                      ),
                    ],
                  )

                ]
            ),
          ),

      );
    }
  }
