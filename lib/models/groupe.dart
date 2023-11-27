class Groupe {
  final String? id;
  final String? libelle;
  final String? description;
  final DateTime? cree_le;
  final DateTime? modifie_le;

  Groupe(
      {this.cree_le, this.description, this.id, this.libelle, this.modifie_le});

  factory Groupe.fromJson(Map<String, dynamic> json) {
    return Groupe(
        cree_le: json['cree_le'],
        description: json['description'],
        id: json['id'],
        libelle: json['libelle'],
        modifie_le: json['modifie_le']);
  }

  Groupe copyWith(
      {String? id,
      String? libelle,
      String? description,
      DateTime? cree_le,
      DateTime? modifie_le}) {
    return Groupe(
        cree_le: cree_le ?? this.cree_le,
        description: description ?? this.description,
        id: id ?? this.id,
        libelle: libelle ?? this.libelle,
        modifie_le: modifie_le ?? this.modifie_le);
  }

  Map<String, dynamic> json() {
    return {
      'cree_le': cree_le,
      'description': description,
      'id': id,
      'libelle': libelle,
      'modifie_le': modifie_le
    };
  }
}
