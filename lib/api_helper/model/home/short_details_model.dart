// .
class UserShortDetails {
  UserShortDetails({
    this.name,
    this.profilePicture,
  });

  String? name;
  String? profilePicture;

  factory UserShortDetails.fromJson(Map<String?, dynamic> json) => UserShortDetails(
    name: json["name"],
    profilePicture: json["user_pro_pic"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "user_pro_pic": profilePicture,
  };
}
