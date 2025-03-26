import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form/Details.dart';
import 'package:form/registrationdetails.dart';
import 'package:form/submittedDetails.dart';
import 'package:form/submitted_button.dart';

class AdminPortal extends StatefulWidget{
  AdminPortal({super.key});
  State<AdminPortal> createState()=>_AdminPortal();

}

class _AdminPortal extends State<AdminPortal>{
  bool showTypesSubmittedRegistrations=false;
  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(
        title: Text("Registration Details"),
        backgroundColor: Colors.orange,
        leading: Builder(
          builder: (context)=>
          IconButton(
              onPressed: (){
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu)
          ),
        ),


      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
          //    margin: EdgeInsets.symmetric(vertical: 20),

              padding:EdgeInsets.symmetric(vertical: 60),
              decoration: BoxDecoration(
                  color: Colors.orange,
                border: Border(
                 // bottom: BorderSide.strokeAlignCenter
                )
              ),
                child: Text("Menu",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,fontSize: 24
                  ),
                )
            ),
            GestureDetector(
              child: ListTile(
                title: Text("Submitted"),
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>SubmittedButton()),
                  ).then((_) {
                    setState(() {
                      showTypesSubmittedRegistrations =
                      !showTypesSubmittedRegistrations;
                    });
                  });
                    if(showTypesSubmittedRegistrations)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text("day Registrations")
                      ,
                  );
                },
                subtitle:Text("day Registrations") ,
              ),
              onTap: (){
                Expanded(
                  child: Text("day Registrations")
                  ,
                );
              },
            ),
            ListTile(
              title: Text("Unsubmitted")
            )
          ],
          
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 200),
        color: Colors.black12,
        alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
            children: [
              SizedBox(width: 60,),
              Text("Day",style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold
              ),),
              Card(
                color: Colors.white,
                child: Table(
                  columnWidths: {  0: FixedColumnWidth(200),  // First column width
                    1: FixedColumnWidth(20),   // Second column width
                    2: FlexColumnWidth(), },
                  children: [
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Number of clicks in a Day"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(":"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("clicks"),
                        )
                      ]

                    ),
                    TableRow(
                        children: [
                          Padding(padding: EdgeInsets.all(8.0),
                            child: Text("Total Submitted Forms"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(':'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("number"),
                          )
                        ]
                    ),

                    TableRow(
                        children: [
                          Padding(padding: EdgeInsets.all(8.0),
                            child: Text("Total UnSubmitted Forms"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(':'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("unnumber"),
                          )
                        ]
                    ),
                  ],
                ),
              ),
              SizedBox(width: 60,),
              Text("Month",style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold
              ),),
              Card(
                color: Colors.white,
                child: Table(
                  columnWidths: {  0: FixedColumnWidth(200),  // First column width
                    1: FixedColumnWidth(20),   // Second column width
                    2: FlexColumnWidth(), },
                  children: [
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Number of clicks in a Day"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(":"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("clicks"),
                          )
                        ]

                    ),
                    TableRow(
                        children: [
                          Padding(padding: EdgeInsets.all(8.0),
                            child: Text("Total Submitted Forms"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(':'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("number"),
                          )
                        ]
                    ),
                    TableRow(
                        children: [
                          Padding(padding: EdgeInsets.all(8.0),
                            child: Text("Total UnSubmitted Forms"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(':'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("unnumber"),
                          )
                        ]
                    ),
                  ],
                ),
              ),
              SizedBox(width: 60,),
              Text("Year",style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold
              ),),
              Card(
                margin: EdgeInsets.symmetric(vertical: 16),
                color: Colors.white,
                child: Table(
                  columnWidths: {  0: FixedColumnWidth(200),  // First column width
                    1: FixedColumnWidth(20),   // Second column width
                    2: FlexColumnWidth(), },
                  children: [
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Number of clicks in a Day"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(":"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("clicks"),
                          )
                        ]

                    ),
                    TableRow(
                        children: [
                          Padding(padding: EdgeInsets.all(8.0),
                            child: Text("Total Submitted Forms"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(':'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("number"),
                          )
                        ]
                    ),

                    TableRow(
                        children: [
                          Padding(padding: EdgeInsets.all(8.0),
                            child: Text("Total UnSubmitted Forms"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(':'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("unnumber"),
                          )
                        ]
                    ),
                  ],
                ),
              )

            ],
                  ),
          )
      ),

    );
  }

}