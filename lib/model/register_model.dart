

class RegisterModel {
  int id;
  String name;
  String email;
  String phone;
  String password;
  String type;
  String file;

  RegisterModel(
      this.id,
      this.name,
      this.email,
      this.phone,
      this.password,
      this.type,
      this.file,
      );

  // Factory constructor to create a Budget object from a map
  RegisterModel.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        email = map['email'],
        phone = map['phone'],
        password = map['password'],
        type = map['type'],
        file = map['file'];

  // Method to convert a Budget object to a map
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name,'email': email, 'phone': phone, 'password': password, 'type': type,'file': file};
  }
}
