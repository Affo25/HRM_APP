
class GuestModel {
  int userId;
  int eventId;
  String name;
  String img;
  String email;
  String phone;
  int totalTickets;
  int totalFreeTickets;
  bool status;

  GuestModel(
     this.userId,
     this.eventId,
     this.name,
     this.img,
     this.email,
     this.phone,
     this.totalTickets,
     this.totalFreeTickets,
      this.status
  );
  GuestModel.fromJson(Map<String, dynamic> map)
      : userId = map['userId'],
        eventId = map['eventId'],
        name = map['name'],
        img = map['img'],
        email = map['email'],
        phone = map['phone'],
        totalTickets = map['totalTickets'],
        totalFreeTickets = map['totalFreeTickets'],
        status = map['status'];

  // Method to convert a Budget object to a map
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'eventId': eventId,
      'name': name,
      'img': img,
      'email': email,
      'phone': phone,
      'totalTickets': totalTickets,
      'totalFreeTickets': totalFreeTickets,
      'status': status,
    };
  }
}