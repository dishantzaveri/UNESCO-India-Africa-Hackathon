class User {
  String? email;
  String? displayName;
  String? address;
  String? avatar;
  String username;
  String? gender;
  String? password;
  int? id;
  List<String>? role;

  User(
      {required this.username,
      this.gender,
      this.role,
      this.displayName,
      this.address,
      this.avatar,
      this.email,
      this.password,
      this.id});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'email': email,
      'username': username,
      'displayName': displayName,
      'address': address,
      "password": password,
      "avatar": avatar,
      "gender": gender,
      "role": role,
      "id":id
    };

    return map;
  }

  factory User.fromMap(Map<String, dynamic> data) {
    return User( 
        gender: data['gender'],
        email: data["email"],
        displayName: data["displayName"],
        avatar: data["avatar"],
        username: data["username"],
        address: data["address"],
        id: data["id"]);
  }

  User copyInstance() {
    return User(
        role: role,
        gender: gender,
        email: email,
        username: username,
        avatar: avatar,
        displayName: displayName,
        id: id);
  }
}
