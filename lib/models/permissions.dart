class Permissions {
  final String? uuid;
  final String? role_id;
  final String? action_id;
  final bool? autorise;

  Permissions({this.action_id, this.autorise, this.role_id, this.uuid});

  Permissions copyWith(
      {String? uuid, String? role_id, String? action_id, bool? autorise}) {
    return Permissions(
        action_id: action_id ?? this.action_id,
        autorise: autorise ?? this.autorise,
        role_id: role_id ?? this.role_id,
        uuid: uuid ?? this.uuid);
  }

  factory Permissions.fromJson(Map<String, dynamic> json) {
    return Permissions(
        action_id: json['action_id'],
        autorise: json['autorise'],
        role_id: json['role_id'],
        uuid: json['uuid']);
  }

  Map<String, dynamic> json() {
    return {
      'action_id': action_id,
      'autorise': autorise,
      'role_id': role_id,
      'uuid': uuid
    };
  }
}
