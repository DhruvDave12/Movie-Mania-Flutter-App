class userData {
  String name;
  String gender;
  String address;
  int age;

  userData(
      {required this.name,
      required this.gender,
      required this.address,
      required this.age});

  // We will have to convert this into type Map<String,dynamic>
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'gender': gender,
      'address': address,
      'age': age,
    };
  }
}
