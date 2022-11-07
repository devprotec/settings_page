import '../util/enum.dart';

class Permission {
  String? id;
  String? label;
  List<PermissionAction>? permissionActions;

  Permission.fromJson(Map<String, dynamic> json)
      : id = json["id"] as String,
        label = json["label"] as String,
        permissionActions = List<PermissionAction>.from(
          json["actions"].map(
            (x) => PermissionAction.values,
          ),
        );
}
