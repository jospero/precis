class Livre {
  final String? uuid;
  final String? libelle;
  final String? description;
  final List<String>? categories;
  final int? compteur_personnes;
  final DateTime? ajout_le;
  final DateTime? modifie_le;
  Livre(
      {this.uuid,
      this.libelle,
      this.description,
      this.categories,
      this.ajout_le,
      this.compteur_personnes,
      this.modifie_le});

  factory Livre.fromJson(Map<String, dynamic> json) {
    return Livre(
        ajout_le: json['ajout_le'],
        categories: json['categories'],
        compteur_personnes: int.tryParse(json['compteur_personnes'].toString()),
        description: json['description'],
        libelle: json['libelle'],
        modifie_le: json['modifie_le'],
        uuid: json['uuid']);
  }

  Livre copyWith(
      {String? uuid,
      String? libelle,
      String? description,
      List<String>? categories,
      int? compteur_personnes,
      DateTime? ajout_le,
      DateTime? modifie_le}) {
    return Livre(
        ajout_le: ajout_le ?? this.ajout_le,
        categories: categories ?? this.categories,
        compteur_personnes: compteur_personnes ?? this.compteur_personnes,
        description: description ?? this.description,
        libelle: libelle ?? this.libelle,
        modifie_le: modifie_le ?? this.modifie_le,
        uuid: uuid ?? this.uuid);
  }

  Map<String, dynamic> json() {
    return {
      'ajout_le': ajout_le,
      'categories': categories,
      'compteur_personnes': compteur_personnes,
      'description': description,
      'libelle': libelle,
      'modifie_le': modifie_le,
      'uuid': uuid,
    };
  }
}
