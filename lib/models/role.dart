import 'package:settings_page/models/permission.dart';

import '../util/enum.dart';

class ProfessionalRole {
  final String text;
  final Status status;

  ProfessionalRole(
    this.text,
    this.status,
  );
}

class RoleAndPermissions {
  String? id;
  String? label;
  List<Permission>? permissions;

  RoleAndPermissions.fromJson(Map<String, dynamic> json)
      : id = json["id"] as String,
        label = json["label"] as String,
        permissions = List<Permission>.from(
            json["permissions"].map((x) => Permission.fromJson(x)));
}
