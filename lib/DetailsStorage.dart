import 'package:flutter/cupertino.dart';

import 'Details.dart';

class DetailsStorage {
 static final DetailsStorage _instance=DetailsStorage._internal();
 factory DetailsStorage()=>_instance;
 DetailsStorage._internal();
 static final List<Details>? _detailList=[];
 void addDetail(Details detail){
   _detailList?.add(detail);
   print("mahendrssss");
   print(_detailList![0].latestEducation);
 }
 List<Details>? getDetails(){
   return _detailList ;
 }
}