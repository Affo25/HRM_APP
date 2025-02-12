class Event {
  int id;
  String? name;
  String venue;
  String startDate;

  String endDate;

  String detail;

  bool status;


  Event(
      this.id,
      this.name,
      this.venue,
      this.startDate,
      this.endDate,
      this.detail,
      this.status
      );

  // Factory constructor to create a Budget object from a map
  Event.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        venue = map['venue'],
        startDate = map['startDate'],
        endDate = map['endDate'],
        detail = map['detail'],
        status = map['status'];

  // Method to convert a Budget object to a map
  Map<String, dynamic> toJson() {
    return {'id': id,
      'name': name,
      'venue': venue,
      'startDate': startDate,
      'endDate': endDate,
      'detail': detail,
      'status': status,
    };
  }
}
