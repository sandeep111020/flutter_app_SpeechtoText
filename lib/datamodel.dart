import 'dart:ffi';

class datamodel{
  //data Type
  int? id;
  String? name;
  String? lname;
  String? email;
  String? imageURL;
  String? gender;
  String? description;
  double? lat;
  double? lon;
// constructor
  datamodel(
      {
        this.id,
        this.name,
        this.lname,
        this.email,
        this.imageURL,
        this.gender,
        this.description,
        this.lat,
        this.lon
      }
      );
  //method that assign values to respective datatype vairables
  datamodel.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    name =json['first_name'];
    lname =json['last_name'];
    email = json['email'];
    imageURL = json['image'];
    gender = json['gender'];
    description= json['description'];
    lat=json['latitude'];
    lon=json['longitude'];
  }
}