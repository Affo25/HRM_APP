enum LeaveStatus { Pending, Approved, Rejected }

class LeaveRequest {
  int userId;
  int currentLoginId;
  String name;
  String reason;
  String message;
  int duration;
  String startDate;
  String status;

  LeaveRequest({
     required this.userId,
    required this.currentLoginId,
     required this.name,
     required this.reason,
    required this.message,
     required this.duration,
     required this.startDate,
    required this.status,
  });
  LeaveRequest.fromJson(Map<String, dynamic> map)
      : userId = map['userId'],
        currentLoginId = map['currentLoginId'],
        name = map['name'],
        reason = map['reason'],
        message = map['message'],
        duration = map['duration'],
        startDate = map['startDate'],
        status = map['status'];

  // Method to convert a Budget object to a map
  Map<String, dynamic> toJson() {
    return {'userId': userId,'currentLoginId': currentLoginId, 'name': name,'reason': reason, 'message': message,'duration': duration,
      'startDate': startDate,
      'status': status,
    };
  }
}