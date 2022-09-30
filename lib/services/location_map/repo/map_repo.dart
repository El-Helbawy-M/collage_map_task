import '../models/floor.dart';

abstract class MapRepo {
  static List<Floor> floors = [
    Floor(
      stands: ["Stand 1", "Stand 2"],
      labs: ["A1", "A2 & A3", "A4"],
      offices: [
        "Benefits Offices",
        "Graduates Affairs",
        "Students Affairs",
        "Graduate Studies Office",
        "IT Office",
      ],
      number: 1,
    ),
    Floor(
      stands: ["Stand 3"],
      labs: [
        "B1 & B2",
        "B3",
        "B4",
        "B5",
      ],
      offices: [
        "Dean's office",
        "Office of the Vice Dean for Community Service and the Environment",
        "Office of the Vice Dean for Education and Student Affairs",
        "Office of the Vice Dean for Graduate Studies",
      ],
      number: 2,
    ),
    Floor(
      stands: ["Stand 4"],
      labs: [
        "C1 & C2",
        "C3",
        "C4",
        "C5",
        "C6 & C7",
      ],
      offices: [
        "Seminar hall",
        "Office of the Head of the Information Technology Department",
        "Office of the Head of the Computer Science Department",
      ],
      number: 3,
    ),
    Floor(
        stands: [],
        labs: ["D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8"],
        offices: [],
        number: 4),
  ];
  static int getFloor(String data) {
    for (int x = 0; x < floors.length; x++) {
      if (floors[x].containes(data)) return floors[x].number;
    }
    return 0;
  }

  static List<String> placeTypes = ["Stands", "Labs", "Offices"];
}
