import 'package:mhc_customer/util/exports.dart';

class User {
  String? createdAt;
  String? customPermissions;
  bool? deleted;
  String? deletedAt;
  String? email;
  String? id;
  bool? isActive;
  bool? isSuperUser;
  bool? isVerified;
  String? modifiedAt;
  String? phonenumber;
  List<RoleAndPermissions>? roles;
  String? username;
  DateTime? dataOfBirth;
  RoleLabel? roleLabel;
  double? balance;
  Genders? gender;
  double? weight;
  double? height;
  String? bloodType;
  String? allergies;
  User(
      {this.createdAt,
      this.customPermissions,
      this.deleted,
      this.deletedAt,
      this.email,
      this.id,
      this.isActive,
      this.isSuperUser,
      this.isVerified,
      this.modifiedAt,
      this.phonenumber,
      this.roles,
      this.username,
      this.dataOfBirth,
      this.roleLabel,
      this.balance,
      this.gender,
      this.weight,
      this.height,
      this.bloodType,
      this.allergies});

  User.fromJson(Map<String, dynamic> json)
      : createdAt = json["created_at"] as String,
        customPermissions = json["custom_permissions"] as String,
        deleted = json["deleted"] as bool,
        deletedAt = json["deleted_at"] as String,
        email = json["email"] as String,
        id = json["id"] as String,
        isActive = json["is_active"] as bool,
        isSuperUser = json["is_superuser"] as bool,
        isVerified = json["is_verified"] as bool,
        modifiedAt = json["modified_at"] as String,
        phonenumber = json["phone_number"] as String,
        roles = List<RoleAndPermissions>.from(
            json["roles"].map((x) => RoleAndPermissions.fromJson(x))),
        username = json["username"];
}

List<String> mapDate(DateTime dateTime) {
  final splitbyHyphene = dateTime.toString().split('-');
  final year = splitbyHyphene[0];
  final month = splitbyHyphene[1];
  final splitBySpace = splitbyHyphene[2].split(' ');
  final day = splitBySpace[0];
  return [day, month, year];
}
