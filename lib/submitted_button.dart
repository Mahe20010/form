import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form/ListDetails.dart';
import 'package:form/registrationdetails.dart';
import 'package:form/selecteddateregistrations.dart';
import 'package:form/submittedDetails.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import 'Details.dart';
import 'functions.dart';

class SubmittedButton extends StatefulWidget {
SubmittedButton({super.key});
 State<SubmittedButton> createState(){return _SubmittedButton();}


}
class _SubmittedButton  extends State<SubmittedButton>{
  Map<DateTime,List<Details>> monthMap={};
  List<Details> totalDetails=[];
  int selectedYear=DateTime.now().year;
  int selctedMonth=DateTime.now().month;
  DateTime _selectedMonthAndYear=DateTime(DateTime.now().year,DateTime.now().month);
  DateTime year=DateTime(DateTime.now().year);
  Map<DateTime, List<Details>> yearMap={};

List<String> months=[
  "January","February","March","April","Map","June","July","August","September",
  "October","November","December"
];
String? _selectedMonth;
  // int getHashCode(){
  //   return
  // }
  @override
  void initState() {
    super.initState();
    loadData();
    setState(() {

    });
  }
  void loadData() async{
    List<Details>? details=await GetDataFromApi();
    if(details==null){
      print("no data");
      return;
    }
    setState(() {
      totalDetails=details;
    });
  }
  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }
  Map<DateTime,List<Details>> getMappedData(){
    Map<DateTime,List<Details>> monthdata=LinkedHashMap(
        equals: isSameDay,
        hashCode: getHashCode
    );
    Map<DateTime,List<Details>> yearData=LinkedHashMap(
        equals: isSameDay,
        hashCode: getHashCode
    );
    for(Details details in totalDetails){
      String date=details.createdAt!;
      DateFormat parsedDate=DateFormat("yyyy-MM-dd");
      DateTime pared=parsedDate.parse(date);
      DateTime created=DateTime(pared.year,pared.month);
      if(!monthdata.containsKey(created)){
        monthdata[created]=[];
      }
      print("created:$created");
      monthdata[created]?.add(details);
    }
    return monthdata;
  }
  Map<DateTime,List<Details>> getYearMappedData(){
    // Map<DateTime,List<Details>> monthdata=LinkedHashMap(
    //     equals: isSameDay,
    //     hashCode: getHashCode
    // );
    Map<DateTime,List<Details>> yearData=LinkedHashMap(
        equals: isSameDay,
        hashCode: getHashCode
    );
    for(Details details in totalDetails){
      String date=details.createdAt!;
      DateFormat parsedDate=DateFormat("yyyy-MM-dd");
      DateTime pared=parsedDate.parse(date);
      DateTime created=DateTime(pared.year);
      if(!yearData.containsKey(created)){
        yearData[created]=[];
      }
      print("created:$created");
      yearData[created]?.add(details);
    }
    return yearData;
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed:(){
                   Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>SelectedDayRegistrations()),
                  ).then((_) {

                   });
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context)=>RegistrationDetails()).then((_)=>
                  //         setState((){}),
                  //     )
                  // );
                }, child:Text("Day Regidtrations")),
            ElevatedButton(
                onPressed: (){

                    _showMonthView();


                },

                child: Text("Month Registrations")
            ),
            ElevatedButton(
                onPressed: (){

                    _showYearView();


                },
                child: Text("Year Registrations")
            )
          ],
       ),
      ),
    );
  }
  Future _showMonthView(){
   return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(

            content: SizedBox(
              height: 250,
              child: Column(


                children: [
                  Align(child: Text("Select Year",textAlign: TextAlign.start,),alignment: Alignment.topLeft,),
                  DropdownButtonFormField(
                      items:List.generate(30, (index)=>2020+index).map((year)=>DropdownMenuItem<int>(child: Text("$year"),value: year,)).toList(),
                      onChanged:(value){
                        setState(() {
                          selectedYear=value!;
                        });
                      }
                  ),
                  SizedBox(height: 20,),
                  Align(alignment: Alignment.topLeft,child: Text("Select Month"),),
                  DropdownButtonFormField(
                     // items: List.generate(12, (index)=>index+1).map((month)=>DropdownMenuItem<int>(child: Text("$month"),value: month,)).toList(),
                    items: months.map((month)=>DropdownMenuItem(child: Text(month,),value: month,)).toList(),
                      onChanged: (value){
                        setState(() {
                          _selectedMonth=value;
                          selctedMonth=months.indexOf(_selectedMonth!)+1;
                        });
                      }),
                  SizedBox(height: 20,),
                  ElevatedButton(
                      onPressed: (){
                        setState(() {
                          _selectedMonthAndYear=DateTime(selectedYear,selctedMonth);
                          monthMap=getMappedData();
                          print(selctedMonth);
                          print("selectedYear");
                          print(selectedYear);
                          print(_selectedMonthAndYear);
                          print(monthMap);

                        });
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context){

                              return ListDetails(details: monthMap[_selectedMonthAndYear]);

                            }));
                      },
                      child: Text("Submit"))
                ],
              ),
            ),
          );
        }
    );

  }
  Future _showYearView(){

    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text("Select Year"),
            content: DropdownButtonFormField(
                items: List.generate(30,(index)=>2020+index).map((year)=>DropdownMenuItem(child: Text("$year"),value: year,)).toList(),
                onChanged: (value){
                  year=DateTime(value!);
                }),
            actions: [
              ElevatedButton(
                  onPressed: (){

                    setState(() {
                      yearMap=getYearMappedData();


                    });
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>ListDetails(details: yearMap[year])));
                  }, child:Text("Submit"))
            ],
          );
        }
    );
  }
  Future dialog(){
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