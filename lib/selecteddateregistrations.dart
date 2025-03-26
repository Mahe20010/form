import 'dart:collection';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form/Details.dart';
import 'package:form/functions.dart';
import 'package:form/submittedDetails.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class SelectedDayRegistrations extends StatefulWidget{
  //List<Details>? totalDetails;
  SelectedDayRegistrations({super.key,});
  State<SelectedDayRegistrations> createState()=>_SelectedDayRegistrations();
}
class _SelectedDayRegistrations extends State<SelectedDayRegistrations>{
List<Details>? totalDetails;
DateTime? _selectedDay;
DateTime? _focusedDay=DateTime.now();
//late  ValueNotifier<List<Event>> _selectedEvents=ValueNotifier<List<Event>>([]);
late int _selectedIndex;
Map<DateTime,List<Event>> mappedEvents={};
List<Event> _selectedEvents=[];
Details? details;
  @override
  void initState(){
    super.initState();
loadDetails();
setState(() {
  _selectedDay=_focusedDay;
 // _selectedEvents=ValueNotifier<List<Event>>([]);

});

  }
  void onSelectedDay(DateTime selectedDay,DateTime focusDay) async{
   // _selectedIndex=-1;

      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusDay;
        _selectedEvents=getEventsOfADay(selectedDay);

      });
      // List<Event> events=await getEvents(selectedDay);
      // _selectedEvents.value=events;


  }
  void loadDetails() async{
    List<Details>? details=await GetDataFromApi();
    if (details == null || details.isEmpty) {
      print("No details received from API");
      return;
    }
    setState(() {

      totalDetails=details;
      mappedEvents=getEventsMappedByDate();
    });
  }
  List<Event> getEvents(DateTime dat){
    List<Event> events=[];
    try{
      // events.add(Event("mahendra"));
      // events.add(Event("title"));
      // events.add(Event("kavitha"));
     // return events;
    }
    catch(e){
      print(e);
    }
    return events;
  }
  Map<DateTime,List<Event>> getEventsMappedByDate(){
    Map<DateTime,List<Event>> mapevents=LinkedHashMap(
      equals: isSameDay,
      hashCode: getHashCode,
    );
    try {
      for (Details eachDetails in totalDetails!) {
        print("na,e");
        print(eachDetails.name);
       // String selecteddate = DateFormat("dd-MM-yyyy").format(day);
        String detailday = eachDetails.createdAt!;
        DateFormat formatted=DateFormat("yyyy-MM-dd");
        DateTime time = formatted.parse(detailday);
        DateTime eventDate = DateTime(time.year, time.month, time.day);
        print(eventDate);
        if(!mapevents.containsKey(eventDate)){
          mapevents[eventDate]=[];
        }
        print(eachDetails);
        mapevents[eventDate]?.add(Event(eachDetails));
      }
    }
    catch(e){
      print(e);
    }
return mapevents;
    }
  List<Event> getEventsOfADay(DateTime day) {

    //Map<DateTime,List<Event>> mappedEvents=getEventsMappedByDate();
    print("getting day from get events of a day method");
    print(day);
      return mappedEvents[day]??[];
  }
  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }
  @override
  Widget build(BuildContext context){



    return Scaffold(
      body: Container(
        child:
            Column(
              children:[ TableCalendar(
                focusedDay: _focusedDay!,
                firstDay: DateTime.parse("2023-02-13"),
                lastDay: DateTime.now(),
                onDaySelected: onSelectedDay,
                selectedDayPredicate: (day){
                  return isSameDay(_selectedDay, day);
                },
               // calendarFormat: _,
               eventLoader: (day){
                  print("eventLoader");
                  return getEventsOfADay(day);},
              ),
                Expanded(
                  child:ListView.builder(
                    itemCount: _selectedEvents.length,
                      itemBuilder: (context,index){
                      print("mahendra");
                      print(_selectedEvents[index].title.name);
                       return Center(child: Card(margin:EdgeInsets.symmetric(horizontal: 20),child: SubmittedDetails(details: _selectedEvents![index].title,count: index)));
                      }),
                  // child:ListView.builder(
                  //   itemCount: 3,
                  //
                  //     itemBuilder: (context,index){
                  //     return Container(
                  //
                  //       child: ListTile(
                  //         onTap: ()async{
                  //
                  //           setState(() {
                  //             _selectedIndex=index;
                  //           //  details?.name=value[index].title;
                  //           });
                  //         },
                  //         title: Text("mahe"),
                  //       ),
                  //     );
                  //     }
                  // ),

                )
           ] ),


      ),
    );
  }
}
class Event{
  Details title;
  Event(this.title);
}