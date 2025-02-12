

class LoginModel {
  int id;
  String email;
  String password;
  String type;

  LoginModel(
      this.id,
      this.email,
      this.password,
      this.type,
      );

  // Factory constructor to create a Budget object from a map
  LoginModel.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        email = map['email'],
        password = map['password'],
        type = map['type'];

  // Method to convert a Budget object to a map
  Map<String, dynamic> toJson() {
    return {'id': id, 'email': email,  'password': password, 'type': type};
  }
}