import '../models/floor.dart';

abstract class Extractor{
  static List<String> extract(List<Floor> data,LocationType type){
    List<String> response = [];
    switch (type) {
      case LocationType.stands:
        for (Floor floor in data){
          response.addAll(floor.stands);
        }
        return response;

      case LocationType.labs:
        for (Floor floor in data){
          response.addAll(floor.labs);
        }
        return response;
      case LocationType.offices:
        for (Floor floor in data){
          response.addAll(floor.offices);
        }
        return response;
      default: return [];
    }
  }
}

enum LocationType{
  stands,
  labs,
  offices,
}