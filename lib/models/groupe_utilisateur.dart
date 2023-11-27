class GroupeUtilisateur {
  final String? id;
  final String? groupe_id;
  final String? utilisateur_id;
  final DateTime? rejoint_le;
  final DateTime? quitte_le;

  GroupeUtilisateur(
      {this.groupe_id,
      this.id,
      this.quitte_le,
      this.rejoint_le,
      this.utilisateur_id});

  factory GroupeUtilisateur.fromJson(Map<String, dynamic> json) {
    return GroupeUtilisateur(
        groupe_id: json['groupe_id'],
        id: json['id'],
        quitte_le: json['quitte_le'],
        rejoint_le: json['rejoint_le'],
        utilisateur_id: json['utilisateur_id']);
  }
}
