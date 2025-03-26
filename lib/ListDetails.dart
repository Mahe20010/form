import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form/submittedDetails.dart';
import 'package:form/submitted_button.dart';
import 'package:universal_html/js.dart';

import 'Details.dart';

class ListDetails extends StatelessWidget{
  List<Details>? details;
  ListDetails({required this.details}){}

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (details == null || details!.isEmpty) {
        dialog(context);
      }
    });
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrations"),
leading: IconButton(
    onPressed: (){
      Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>SubmittedButton()), (router)=>false);
    },
    icon: Icon(Icons.arrow_back)
),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(

              child:(details==null||details!.isEmpty)?Center(child: Text("data"),):
                ListView.builder(
                itemCount: details?.length??0,
                  itemBuilder: (context,index){
                    return Card(
                      child: SubmittedDetails(details: details![index], count: index),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
  Future dialog(BuildContext context){
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title:Text( "No Registrations are made for selected date"),
            actions: [
              ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  }, child: Text("close"))
            ],
          );

        });
  }
}