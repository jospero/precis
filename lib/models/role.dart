class Role {
  final String? uuid;
  final String? libelle;
  final String? description;
  final DateTime? cree_le;
  final DateTime? modifie_le;

  Role({
    this.cree_le,
    this.description,
    this.libelle,
    this.modifie_le,
    this.uuid,
  });

  Role copyWith(
      {String? uuid,
      String? libelle,
      String? description,
      DateTime? cree_le,
      DateTime? modifie_le}) {
    return Role(
        cree_le: cree_le ?? this.cree_le,
        description: description ?? this.description,
        libelle: libelle ?? this.libelle,
        modifie_le: modifie_le ?? this.modifie_le,
        uuid: uuid ?? this.uuid);
  }

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
        cree_le: json['cree_le'],
        description: json['description'],
        libelle: json['libelle'],
        modifie_le: json['modifie_le'],
        uuid: json['uuid']);
  }

  Map<String, dynamic> json() {
    return {
      'cree_le': cree_le,
      'description': description,
      'libelle': libelle,
      'modifie_le': modifie_le,
      'uuid': uuid
    };
  }
}
