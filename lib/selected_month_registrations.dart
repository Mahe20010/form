import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form/Details.dart';
import 'package:form/functions.dart';
import 'package:form/registrationdetails.dart';
import 'package:form/selecteddateregistrations.dart';
import 'package:form/submittedDetails.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class SelectedMonthRegistrations extends StatefulWidget {
  //DateTime month;
  SelectedMonthRegistrations();

  State<SelectedMonthRegistrations> createState() =>
      _SelectedMonthRegistrations();
}


class _SelectedMonthRegistrations extends State<SelectedMonthRegistrations>{
  Map<DateTime,List<Details>> monthMap={};
  List<Details> totalDetails=[];
  int selectedYear=DateTime.now().year;
  int selctedMonth=DateTime.now().month;
  DateTime _selectedMonthAndYear=DateTime(DateTime.now().year,DateTime.now().month);

  // int getHashCode(){
  //   return
  // }
  @override
  void initState() async{
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
    Map<DateTime,List<Details>> data=LinkedHashMap(
      equals: isSameDay,
      hashCode: getHashCode
    );
    for(Details details in totalDetails){
      String date=details.createdAt!;
      DateFormat parsedDate=DateFormat("yyyy-MM-dd");
      DateTime pared=parsedDate.parse(date);
      DateTime created=DateTime(pared.year,pared.month);
      if(!data.containsKey(created)){
        data[created]=[];
      }
      data[created]?.add(details);
    }
    return data;
  }
  void _showMonthView(){
        showModalBottomSheet(
            context: context,
            builder: (context){
              return Container(
                padding: EdgeInsets.all(16),
                child: Column(

                  children: [
                    Text("Select Year"),
                    DropdownButtonFormField(
                        items:List.generate(30, (index)=>2020+index).map((year)=>DropdownMenuItem<int>(child: Text("$year"),value: year,)).toList(),
                        onChanged:(value){
                          setState(() {
                            selectedYear=value!;
                          });
                        }
                    ),
                    SizedBox(height: 20,),
                    DropdownButtonFormField(
                        items: List.generate(12, (index)=>index+1).map((month)=>DropdownMenuItem<int>(child: Text("$month"),value: month,)).toList(),
                        onChanged: (value){
                          setState(() {
                            selctedMonth=value!;
                          });
                        }),
                    SizedBox(height: 20,),
                    ElevatedButton(
                        onPressed: (){
                          setState(() {
                            _selectedMonthAndYear=DateTime(selectedYear,selctedMonth);
                          });
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context){

                                  return SubmittedDetails(details: monthMap[_selectedMonthAndYear]!.first, count: 0);

                          }));
                        },
                        child: Text("Submit"))
                  ],
                ),
              );
            }
        );

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    return Scaffold(
      //body:
    );
  }
}