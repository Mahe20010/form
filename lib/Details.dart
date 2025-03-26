class Details{
  String? name;
  String? email;
  String? phone;
  String? college;
  String? gpa;
  String? latestEducation;
  String? State;
  String? district;
  String? gender;
  String? skills;
  String? createdAt;
  Details( {
    this.State,
    this.gender,this.phone,this.name,this.email,this.district,this.college,
    this.gpa,this.latestEducation,this.skills,this.createdAt
});
  Map<String,dynamic>? toJson(){
    return {
      "college":college,
      "gender":gender,
      "State":State,
      "skills":skills,
      "district":district,
      "latestEducation":latestEducation,
      "name":name,
      "phone":phone,
      "email":email,
      "gpa":gpa,
      "createdAt":createdAt,
    };
  }
  List<Map<String,dynamic>?> jsonList(List<Details> detailList){
    return detailList.map((details)=>details.toJson()).toList();
  }
  factory Details.fromJson(Map<String,dynamic> json){
    return Details(
     // id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json["phone"],
      gpa:json["gpa"],
      latestEducation: json["latestEducation"],
      college: json["college"],
      district: json["district"],
      skills: json["skills"],
      State: json["State"],
      gender: json["gender"],
      createdAt: json["createdAt"],

    );
  }


}