import '../../../helpers/localization.dart';

class SubmitionModel {
  String location, image;
  int floor;
  int currentFloor;
  late String description;
  SubmitionModel({required this.location,required this.floor,required this.currentFloor,required this.image}){
    if(floor < currentFloor){
      description = "${getLang("go downstairs to floor ")}$floor${getLang(", and follow this map")}";
    }
    else if(floor > currentFloor){
      description = "${getLang("go upstairs to floor ")}$floor${getLang(", and follow this map")}";
    }
    else {
      description = "${getLang("please follow this map")}";
    }
  }
}