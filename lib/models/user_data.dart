class userData {
  String uid;
  String name;
  String gender;
  String address;
  int age;

  userData(
      {required this.uid,
      required this.name,
      required this.gender,
      required this.address,
      required this.age});

  // We will have to convert this into type Map<String,dynamic>
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'gender': gender,
      'address': address,
      'age': age,
    };
  }
}
