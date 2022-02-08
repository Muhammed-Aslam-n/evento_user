// .
class UserWholeDetailsModel {
  UserWholeDetailsModel({
    this.name,
    this.email,
    this.phoneNumber,
    this.profilePicture,
  });

  String? name;
  String? email,phoneNumber;
  String? profilePicture;

  factory UserWholeDetailsModel.fromJson(Map<String?, dynamic> json) => UserWholeDetailsModel(
    name: json["name"],
    profilePicture: json["user_pro_pic"],
    email: json["email"],
    phoneNumber: json["phone_number"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "user_pro_pic": profilePicture,
    "email": email,
    "phone_number": phoneNumber,
  };
}
