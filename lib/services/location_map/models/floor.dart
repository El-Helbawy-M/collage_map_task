class Floor {
  List<String> stands = [];
  List<String> labs = [];
  List<String> offices = [];
  int number;

  bool containes(String data) => stands.contains(data) ||
        labs.contains(data) ||
        offices.contains(data);

  Floor(
      {required this.stands,
      required this.labs,
      required this.offices,
      required this.number});
}
