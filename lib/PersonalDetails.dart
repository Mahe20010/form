import 'dart:io';
import 'package:form/DetailsStorage.dart';
import 'package:form/adminportal.dart';
import 'package:universal_html/html.dart' as html;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:form/EducationalQualification.dart';
import 'package:form/functions.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:ui' as ui;

import 'Details.dart';
import 'Variables.dart';

class PersonalDetails extends StatefulWidget{
  const PersonalDetails({super.key});
  @override
  State<StatefulWidget> createState()=>_PersonalDetails();

}
class _PersonalDetails extends State<PersonalDetails>{
  Details details=new Details();
  final myController=TextEditingController();
  String storedText="";
  String? selectedState;
  String? selectedDistrict;
  String? selectedGender;
  List<String> gender=["Male","Female","Other"];
  final _formKety=GlobalKey<FormState>();
  String? name;
  String? qualification;
  String? email;
  String? organisation;
  String? phone;
  DateTime? selectedDay;
  String? address;
  Uint8List? _fileBytes;
  String? _filePath;
  String? _fileExtension;
  List<Details>? detailList;
  TextEditingController skillsController=TextEditingController();
  TextEditingController gpaController=TextEditingController();
  TextEditingController genderController=TextEditingController();
  TextEditingController dateController=TextEditingController();
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController qualificationController=TextEditingController();
  TextEditingController organisationController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController addressController=TextEditingController();
  TextEditingController specilizationController=TextEditingController();
  TextEditingController collegeController=TextEditingController();
  //final result=FilePickerResult();
  @override
  void dispose(){
    myController.dispose();

  }
  @override
  void initState(){
    super.initState();
    loadFormData();
  }
  Future<void> loadFormData() async{
    final prefs=await SharedPreferences.getInstance();
    setState(() {
      nameController.text=prefs.getString("name")??"";
      print("loadformdata ${nameController.text}");
      emailController.text=prefs.getString("email")??"";
      phoneController.text=prefs.getString("phone")??"";
      qualificationController.text=prefs.getString("qualification")??"";
      organisationController.text=prefs.getString("organisation")??"";
      selectedState=prefs.getString("selectedState")??null;
      selectedDistrict=prefs.getString("selectedDistrict")??null;
      dateController.text=prefs.getString("DateOfBirth")??"";
      genderController.text=prefs.getString("gender")??"";
      addressController.text=prefs.getString("address")??"";
      selectedGender=prefs.getString("gender");
      specilizationController.text=prefs.getString("specilization")??"";
      print("getformdata${prefs.getString("gender")}");
      print("getformdata${prefs.getString("selectedDistrict")}");
      print("getformdata${prefs.getString("selectedState")}");
      collegeController.text=prefs.getString("college")??"";

    });
  }
  Future<void> saveFormData() async{
    final prefs=await SharedPreferences.getInstance();
    await prefs.setString("name", nameController.text);

    await prefs.setString("email",emailController.text);
    await prefs.setString("phone", phoneController.text);
    await prefs.setString("organisation", organisationController.text);
    await prefs.setString("qualification",qualificationController.text);
    await prefs.setString("selectedState", selectedState??"");
    await prefs.setString("selectedDistrict", selectedDistrict??"");
    await prefs.setString("DateOfBirth", dateController.text);
    await prefs.setString("gender", selectedGender??"");
    await prefs.setString("address", addressController.text);
    await prefs.setString("specilization", specilizationController.text);
    await prefs.setString("college",collegeController.text);
    print("setformdata${prefs.getString("gender")}");
    print("setformdata${prefs.getString("selectedDistrict")}");
    print("setformdata${prefs.getString("selectedState")}");
  }
  Future<void> pickFile() async{
    FilePickerResult? result=await FilePicker.platform.pickFiles();
    if(result!=null){
      setState(() {
        _fileBytes=result.files.single.bytes;
        _fileExtension=result.files.single.extension;
        _filePath=result.files.single.extension;
      });
    }
  }
  Future<String> get _localFile async{
    if(kIsWeb){
      return "userdata.text";
    }
    else {
      final directory = await getApplicationDocumentsDirectory();
      return '${directory.path}/userdata.txt';
    }
  }
  Future<void> writeData(String text) async{
    final file=await _localFile;
    //await file.w;
    setState(() {
      storedText=text;
    });
  }
  Future<void> readData() async{
    try{
      final file=await _localFile;
      //String content=await file.readAsString();
    setState(() {
      //storedText=content;
    });
    }
    catch(e){
      print(e);
    }
  }
  // @override
  // void initState(){
  //   super.initState();
  //   readData();
  // }
  @override
  Widget build(BuildContext context){

    //String qualification="";
    List<String> dropdowmItems=["option 1","option 2", "option 3"];

    double screenwidth=MediaQuery.of(context).size.width;
    double padddingSize=screenwidth*0.2;

    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.amberAccent,
        title: Center(child: Text("Registration Form")),
      ),
      body:
          Center(
            child: SingleChildScrollView(
              child: Container(
                padding:(kIsWeb)? EdgeInsets.symmetric(vertical: padddingSize/6,horizontal: padddingSize*1):
                EdgeInsets.symmetric(),
                alignment: Alignment.centerLeft,
                child: Center(
                  child: Form(
                    key: _formKety,
                    child: Column(
                     // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      //  Container(alignment:Alignment.topLeft,child: Text("Name",style: TextStyle(fontWeight: FontWeight.bold),)),
                        inputField(
                            Name: "Full Name",
                            hintText: "Enter Name",
                           // name: name,
                            controller: nameController,
                          onChanged: (String? na){
                            saveFormData();
                              setState((){
                                name =na;
                                name=nameController.text;
                               // print("name${name}");
                              });

                          },
                          regix:RegExp(r'^[a-zA-z. ]*$'),
                          maxLength: 20,
                          keyboardType: TextInputType.name,
                        ),

                        inputField(
                            Name: "Email",controller: emailController,
                            onChanged:(String ? value){
                              setState(() {
                                email=value;
                                print("email${email}");
                              });
                  },
                          maxLength: 30,
                          keyboardType: TextInputType.emailAddress
                        ),
                        inputField(
                            Name: "Phone Number",
                           controller: phoneController,
                          onChanged: (String? val){
                              setState(() {
                                phone=val;
                                print("phone${phone}");
                              });
                          },
                          regix: RegExp(r'^[0-9]*$'),
                          maxLength: 10,
                          keyboardType: TextInputType.phone,
                        ),
                        const Text("Date of Birth",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        //const SizedBox(height: 30,),
                       TextFormField(
                         decoration: InputDecoration(
                           suffixIcon: GestureDetector(
                               child: Icon(Icons.edit_calendar),
                             onTap: () async{
                               DateTime? pickedDate= await showDatePicker(
                                 context: context,
                                // initialDate: DateTime.now(),
                                 firstDate: DateTime.utc(2010, 10, 16),
                                 lastDate: DateTime.utc(2030, 3, 14),
                                 initialDatePickerMode: DatePickerMode.day,
                                 initialEntryMode: DatePickerEntryMode.calendarOnly
                               );
                               if(pickedDate!=null){
                                 setState(() {
                                   saveFormData();
                                   String text="${pickedDate.toLocal()}".split(" ")[0];
                                   dateController.text=text.replaceAll("-", "/");
                                 });
                               }
                             },
                           )
                         ),

                         readOnly: true,
                         controller: dateController,
                       ),
                        const SizedBox(height: 30,),
                        const Text("Gender",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                          ),
                        ),
                        SizedBox(height: 20,),
                        selection(
                            dropdownItems:gender ,
                            onChanged: (String? value){
                              if(selectedGender==null){
                                selectedGender=value;
                                saveFormData();
                              }
                              else{
                                selectedGender=selectedGender;
                              }

                            },
                            value: selectedGender,
                            hint: "Select Gender"),
                        SizedBox(height: 30,),
                        // inputField(
                        //     onChanged: (String? or){
                        //       saveFormData();
                        //       setState(() {
                        //
                        //         organisation=or;
                        //       });
                        //     },
                        //     Name: "Organisation",
                        //     controller: organisationController,
                        //   maxLength: 30,
                        // ),
                        // inputField(
                        //     Name: "Qualification",
                        //     hintText: "eg : BSc",
                        //     controller: qualoificationController,
                        //     onChanged: (String? na) {
                        //       saveFormData();
                        //       setState(() {
                        //         qualification = na;
                        //         print("name${qualification}");
                        //       });
                        //     },
                        //   maxLength: 30,
                        //
                        // ),
                       // const SizedBox(height: 30,),
                        const Text("State",style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),),
                       const SizedBox( height :20),

                        selection(
                            dropdownItems:indianStates,
                          hint: "Select State",
                          value: selectedState ,
                          onChanged: (String? newState){
                              setState(() {
                                if(selectedState==null){
                                  selectedState=newState;
                                  selectedDistrict=null;
                                  saveFormData();
                                }
                                else{
                                  selectedState=selectedState;
                                  selectedDistrict=selectedDistrict;
                                }

                              });
                          },
                        ),
                        const SizedBox(height:30),
                          const Text(
                            "District",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height:20),
                          selection(
                            dropdownItems: indianDistricts[selectedState]??[],
                            hint: "Select District",
                            value: selectedDistrict,
                            onChanged: (String? newDistrict) {
                              setState(() {
                                if(selectedDistrict==null){
                                  selectedDistrict = newDistrict;
                                  print(selectedDistrict);
                                }
                                else{
                                  selectedDistrict=selectedDistrict;
                                }
                                saveFormData();
                              });
                            },
                          ),
                        SizedBox(height: 30,),
                        inputField(
                          Name: "Address",
                            controller: addressController,
                            onChanged: (String? value){
                            setState(() {
                              saveFormData();
                              address=value;
                            });

                            },
                            maxLength: 50
                        ),
                        const Text("Highest Qualification*",
                          style: TextStyle(
                            fontWeight:FontWeight.bold,
                            fontSize:16

                          ),
                        ),
                        SizedBox(height:20),
                        TextFormField(
                          validator: (value){
                            if(value==null||value.isEmpty){
                              return "Required this field";
                            }
                            else if(value.length<6||value.length>30){
                              return "Required Field length between 6-30";
                            }
                            else{
                              return null;
                            }
                          },
                          controller:qualificationController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40)
                            ),
                            counterText: "${qualificationController.text.length}/30",
                          ),
                          maxLength: 30,
                          maxLengthEnforcement:MaxLengthEnforcement.enforced ,
                          onChanged: (value){
                            setState(() {
                              saveFormData();
                            });
                          },
                        ),
                        const SizedBox(height: 30,),
                        const Text("Specilization*",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height:20),
                        TextFormField(
                          controller: specilizationController,
                          validator: (value){
                            if(value==null||value.isEmpty){
                              return "Please enter your specilization";
                            }
                            else if(value.length<7||value.length>30){
                              return "Allowed length between 7-30";
                            }
                            else{
                              return null;
                            }
                          },
                          maxLength: 30,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40)
                            ),
                            counterText: "${specilizationController.text.length}/30"
                          ),
                          onChanged: (value){

                              saveFormData();

                          },

                        ),
                       const SizedBox(height:30),
                       const Text("University/College Name",
                          style: TextStyle(
                            fontSize:16,
                            fontWeight:FontWeight.bold
                          ),
                        ),
                        const SizedBox(height:20),
                        TextFormField(
                          controller:collegeController,
                          maxLength: 40,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          onChanged: (value){
                            saveFormData();
                          },
                          decoration: InputDecoration(
                            counterText:"${collegeController.text.length}/40",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                            )
                          ),
                          validator: (value){
                            if(value==null||value.isEmpty){
                              return "please enter your college/University";
                            }
                            else if(value.length<7||value.length>40){
                              return "Allowed Length Between 7-40";
                            }
                            else{
                              return null;
                            }
                          },
                        ),
                        Text("Year of Passing",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        SizedBox(height:20),
                        TextFormField(
                          validator: (value){
                            if(value==null||value.isEmpty){
                              return "Please enter your year of passing";
                            }
                          },
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40)
                            )
                          ),
                        ),
                    SizedBox(height: 30,),
                    Text("Percenatge/CGPA*",style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    TextFormField(
                      controller: gpaController,
                      validator: (value){
                        if(value==null||value.isEmpty){
                          return "Please enter your Percentage/CGPA";
                        }
                      },
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40)
                          )
                      ),
                    ),
                        SizedBox(height: 30,),
                        Text("Skills*",style: TextStyle(fontWeight: FontWeight.bold),),
                        SizedBox(height: 20,),
                        TextFormField(
                          controller: skillsController,
                          validator: (value){
                            if(value==null||value.isEmpty){
                              return "Please enter your Skills";
                            }
                          },
                         // inputFormatters: [FilteringTextInputFormatter],
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40)
                              )
                          ),
                        ),
                        SizedBox(height: 30,),
                        Text("Certificates*",style: TextStyle(fontWeight: FontWeight.bold),),
                        SizedBox(height: 20,),
                    Row(
                      children: [
                        ElevatedButton(
                            onPressed:pickFile,
                            child: Text("upload file")),
                        SizedBox(width: 40,),
                        _fileBytes!=null?GestureDetector(
                          child: _fileExtension=="pdf"?Icon(Icons.picture_as_pdf,size: 80,):Image.memory(
                            _fileBytes!,width: 100,height: 80,
                            alignment: Alignment.centerRight,
                          ),
                          onTap: showFullView,
                        ):Text("No image selected"),
                      ],
                    ),
                        SizedBox(height: 5), // Space between button and hint

                        // ✅ Hint text below the button
                        Text(
                          "Only PDF and JPG files are supported",
                          style: TextStyle(fontSize: 13, color: Colors.blueAccent),
                        ),
                    SizedBox(height: 30,),
                        Text("Resume*",style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 14
                        ),),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        ElevatedButton(onPressed: pickFile, child: Text("Upload File")),
                        SizedBox(width: 50,),
                        (_fileBytes!=null)?GestureDetector(
                          child: _fileExtension=="pdf"?Icon(Icons.picture_as_pdf,size: 80,):Image.memory(
                            _fileBytes!,width: 100,height: 80,
                            alignment: Alignment.centerRight,
                          ),
                          onTap: showFullView,
                        ):Text("No File selected"),

                      ],
                    ),

                        SizedBox(height: 5), // Space between button and hint

                        // ✅ Hint text below the button
                        Text(
                          "Only PDF and JPG files are supported",
                          style: TextStyle(fontSize: 13, color: Colors.blueAccent),
                        ),
                        SizedBox(height: 30,),

                    ElevatedButton(
                        onPressed:() async {
                          print(
                            "success"
                          );
                          if(_formKety.currentState!.validate()) {

                            preview();
                            print("clicked");
                          }

                        } ,
                        child: Text("preview"))

                      ],
                    ),
                  ),
                ),

              ),
            ),

          ),


    );
  }
Widget inputField({
  String? Name,String? hintText,required TextEditingController controller,
  required void Function(String?) onChanged,RegExp? regix, required int maxLength,
  TextInputType? keyboardType
}){

    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(Name!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
        SizedBox(height: 20,),
        TextFormField(
          keyboardType: keyboardType,
          //initialValue: name,
          inputFormatters: regix != null ? [FilteringTextInputFormatter.allow(regix)] : [],


          validator: (value){
            if(value==null||value.isEmpty){
              return "Please enter text length of 7-30";
            }
            else if(value.length<7||value.length>30){
              return "Required field length is 7-30";
            }
            else{
              return null;
            }
          },
          controller: controller,
          onChanged: onChanged,
          //     (value){
          //   setState(() {
          //     name=value;
          //     print("llll");
          //     print(name);
          //     print("object");
          //   //  print(value);
          //   });
          // },
          selectionWidthStyle: ui.BoxWidthStyle.tight,
          maxLength: maxLength,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          decoration: InputDecoration(
            //labelText: "Name",
            //label: Text("Full Name"),
            counterText: "${controller.text.length}/${maxLength}",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(
              )
            ),
            hintText: hintText,
          ),
          ),
      //  SizedBox(height: 30,),
      ],
    );
}
Widget selection(
  {required List<String> dropdownItems,
  required void Function(String?) onChanged,
  required String? value,
  required String hint

  }){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black87,
          width: 0.5,
        ),
            borderRadius: BorderRadius.circular(40),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<String>(
          focusColor: Colors.white12,
          validator: (value){
            if(value==null||value.isEmpty) {
              return "please select state";
            }
          },
         iconDisabledColor: Colors.white,
          alignment: AlignmentDirectional.topStart,
          value: (value != "" ? value : null),
            hint: Text(hint),
            items: dropdownItems.map((String item){
              return DropdownMenuItem<String>(
                value: item,
                  child: Text(item)
              );
            }).toList(),
            onChanged: onChanged,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 30),

          ),
      ),
    ));
}
void showFullView() {
  if (_fileBytes == null) return;
  if (_fileExtension == 'pdf') {
    if (kIsWeb) {
      // ✅ Open PDF in a new browser tab for Web
      final blob = html.Blob([_fileBytes], 'application/pdf');
      final url = html.Url.createObjectUrlFromBlob(blob);
      html.window.open(url, "_blank");
      html.Url.revokeObjectUrl(url);
    } else {
      // ✅ Use Syncfusion PDF Viewer for Android/iOS
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: SizedBox(
              height: 500,
            //  child: //SfPdfViewer.memory(_fileBytes!),
            ),
          );
        },
      );
    }
  } else {
    // ✅ Show Image for all platforms
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Stack(
              children:[ Image.memory(_fileBytes!),
                Positioned(
                  right: 10,
                    top: 10,
                    child: IconButton(
                        onPressed: ()=>Navigator.of(context).pop(),
                        icon: Icon(Icons.close,color: Colors.black87)
                    )
                )
              ]
        )
        );
      },
    );
  }
}
void preview() {
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Preview"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text("Name :${nameController.text} "),
                  Text("Email  :${emailController.text}"),
                  Text("Phone   :  ${phoneController.text}")

                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text("Close")
              ),
              ElevatedButton(
                  onPressed:()async {
                    // submitData(
                    //     context,
                    //     nameController.text,
                    //     emailController.text,
                    //     qualificationController.text,
                    //     phoneController.text,
                    //     selectedState!,
                    //     selectedDistrict!);
                    // print(name! + email! + qualification! + phone! +
                    //     selectedState! + selectedDistrict!);
                    Details newDetails=Details(
                        latestEducation:qualificationController.text,
                        //  print(details.latestEducation!+"mahendra");
                        district:selectedDistrict,
                        State:selectedState,
                        skills:skillsController.text,
                        gender:genderController.text,
                        phone:phoneController.text,
                        name:nameController.text,
                        email:emailController.text,
                        gpa:gpaController.text,
                        college:organisationController.text);
                    DetailsStorage().addDetail(newDetails);
                    submitData(context, newDetails);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("form submitted successfully")));

                    final prefs = await SharedPreferences.getInstance();
                    prefs.clear();

                    setState(() {
                      print('mahendra');
                      print(qualificationController.text);


                      selectedState = null;
                      selectedDistrict = null;
                      nameController.clear();
                      emailController.clear();
                      phoneController.clear();
                      gpaController.clear();
                      skillsController.clear();
                      qualificationController.clear();
                      organisationController.clear();
                    });
                    print(details);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) =>AdminPortal()),
                    );
                  }, child:
              Text("Submit"),
                  )

            ],
          );

        });
}
}