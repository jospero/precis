class Utilisateur {
  final String? uuid;
  final String? nom;
  final String? prenom;
  final DateTime? date_naiss;
  final String? sexe;
  final String? nom_utilisateur;
  final List<String>? roles;
  final DateTime? cree_le;
  final DateTime? modifie_le;

  Utilisateur(
      {this.cree_le,
      this.date_naiss,
      this.modifie_le,
      this.nom,
      this.nom_utilisateur,
      this.prenom,
      this.roles,
      this.sexe,
      this.uuid});

  factory Utilisateur.fromJson(Map<String, dynamic> json) {
    return Utilisateur(
      cree_le: json['cree_le'],
      date_naiss: json['date_naiss'],
      modifie_le: json['modifie_le'],
      nom: json['nom'],
      nom_utilisateur: json['nom_utilisateur'],
      prenom: json['prenom'],
      roles: json['roles'],
      sexe: json['sexe'],
      uuid: json['uuid'],
    );
  }

  Utilisateur copyWith(
      {String? uuid,
      String? nom,
      String? prenom,
      DateTime? date_naiss,
      String? sexe,
      String? nom_utilisateur,
      List<String>? roles,
      DateTime? cree_le,
      DateTime? modifie_le}) {
    return Utilisateur(
        cree_le: cree_le ?? this.cree_le,
        date_naiss: date_naiss ?? this.date_naiss,
        modifie_le: modifie_le ?? this.modifie_le,
        nom: nom ?? this.nom,
        nom_utilisateur: nom_utilisateur ?? this.nom_utilisateur,
        prenom: prenom ?? this.prenom,
        roles: roles ?? this.roles,
        sexe: sexe ?? this.sexe,
        uuid: uuid ?? this.uuid);
  }

  Map<String, dynamic> json() {
    return {
      'cree_le': cree_le,
      'date_naiss': date_naiss,
      'modifie_le': modifie_le,
      'nom': nom,
      'nom_utilisateur': nom_utilisateur,
      'prenom': prenom,
      'roles': roles,
      'sexe': sexe,
      'uuid': uuid,
    };
  }
}
