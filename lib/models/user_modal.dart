class UserModal {
  String name;
  String email;
  String? uid;
  UserModal({required this.name, required this.email, this.uid});
  Map<String, dynamic> toJson() {
    return {"name": name, "eamil": email, "uid": uid};
  }

  static UserModal fromJson(Map<String, dynamic> json) {
    return UserModal(
      name: json["name"],
      email: json["email"],
      uid: json["uid"],
    );
  }
}
