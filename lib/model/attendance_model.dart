
class AttendanceModel {
  int userId;
  int currentLoginId;
  String name;
  String date;
  String email;
  String attendance;

  AttendanceModel({
    required this.userId,
    required this.currentLoginId,
    required this.name,
    required this.date,
    required this.email,
    required this.attendance,
  });
  AttendanceModel.fromJson(Map<String, dynamic> map)
      : userId = map['userId'],
        currentLoginId = map['currentLoginId'],
        name = map['name'],
        date = map['date'],
        email = map['email'],
        attendance = map['attendance'];

  // Method to convert a Budget object to a map
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'currentLoginId': currentLoginId,
      'name': name,
      'date': date,
      'email': email,
      'attendance': attendance,
    };
  }
}