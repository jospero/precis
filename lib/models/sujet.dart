class Sujet {
  final String? id;
  final String? titre;
  final String? sujet_id;
  final String? theme_id;
  final String? auteur;
  final DateTime? cree_le;
  final DateTime? modifie_le;

  Sujet(
      {this.auteur,
      this.cree_le,
      this.id,
      this.modifie_le,
      this.sujet_id,
      this.theme_id,
      this.titre});
}
