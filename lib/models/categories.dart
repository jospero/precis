class Categories {
  final String? uuid;
  final String? libelle;
  final String? description;

  Categories({this.uuid, this.libelle, this.description});

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
        uuid: json['uuid'],
        description: json['description'],
        libelle: json['libelle']);
  }

  Categories copyWith({String? uuid, String? libelle, String? description}) {
    return Categories(
        uuid: uuid ?? this.uuid,
        description: description ?? this.description,
        libelle: libelle ?? this.libelle);
  }

  Map<String, dynamic> json() {
    return {'uuid': uuid, 'description': description, 'libelle': libelle};
  }
}
