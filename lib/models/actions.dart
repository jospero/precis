class Actions {
  final String? uuid;
  final String? libelle;
  final String? url;
  final String? methode;
  final DateTime? cree_le;
  final DateTime? modifie_le;

  Actions(
      {this.cree_le,
      this.libelle,
      this.methode,
      this.modifie_le,
      this.url,
      this.uuid});

  Actions copyWith(
      {String? uuid,
      String? libelle,
      String? url,
      String? methode,
      DateTime? cree_le,
      DateTime? modifie_le}) {
    return Actions(
        cree_le: cree_le ?? this.cree_le,
        libelle: libelle ?? this.libelle,
        methode: methode ?? this.methode,
        modifie_le: modifie_le ?? this.modifie_le,
        url: url ?? this.url,
        uuid: uuid ?? this.uuid);
  }

  factory Actions.fromJson(Map<String, dynamic> json) {
    return Actions(
        cree_le: json['cree_le'],
        libelle: json['libelle'],
        methode: json['methode'],
        modifie_le: json['modifie_le'],
        url: json['url'],
        uuid: json['uuid']);
  }

  Map<String, dynamic> json() {
    return {
      'cree_le': cree_le,
      'libelle': libelle,
      'methode': methode,
      'modifie_le': modifie_le,
      'url': url,
      'uuid': uuid
    };
  }
}
