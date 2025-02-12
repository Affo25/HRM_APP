

class Contact {
  int id;
  String title;
  String profession;
  String mobile;
  String image;

  Contact(
    this.id,
    this.title,
    this.profession,
    this.mobile,
    this.image,
  );

  // Factory constructor to create a Budget object from a map
  Contact.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        profession = map['profession'],
        mobile = map['mobile'],
        image = map['image'];

  // Method to convert a Budget object to a map
  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title,'profession': profession, 'mobile': mobile, 'image': image};
  }
}
