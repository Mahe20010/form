import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form/DetailsStorage.dart';
import 'package:form/functions.dart';
import 'package:form/submittedDetails.dart';

import 'Details.dart';

class RegistrationDetails extends StatefulWidget{
  RegistrationDetails({super.key});
  State<RegistrationDetails> createState()=>_RegistrationDetails();
}
class _RegistrationDetails extends State<RegistrationDetails>{

  List<Details>? detailList;
  void loadDetails() async{
    List<Details>? details = await GetDataFromApi()  ;
    setState(() {
      detailList = details ;
    });
    print(detailList);
  }
  @override
  void initState(){
    super.initState();
     loadDetails();
}
  @override
  Widget build(BuildContext context){

    //print(detailList?[0].latestEducation);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            (detailList==null||detailList!.isEmpty)?Text("No Registrations Yet")
            :
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: detailList?.length,
                itemBuilder: (context,index){

                  return Center(child: Card(margin:EdgeInsets.symmetric(horizontal: 50),child: SubmittedDetails(details: detailList![index],count: index,),));
                }
            )
        
          ],
        ),
      ),
    );
  }
  void getDetails(){

  }
}