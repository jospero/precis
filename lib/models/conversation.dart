class Conversation {
  final String? id;
  final String? envoyeur_id;
  final String? recepteur_id;
  final String? groupe_id;
  final String? message;
  final DateTime? cree_le;
  final DateTime? modifie_le;

  Conversation(
      {this.cree_le,
      this.envoyeur_id,
      this.groupe_id,
      this.id,
      this.message,
      this.modifie_le,
      this.recepteur_id});

  Conversation copyWith(
      {String? id,
      String? envoyeur_id,
      String? recepteur_id,
      String? groupe_id,
      String? message,
      DateTime? cree_le,
      DateTime? modifie_le}) {
    return Conversation(
        cree_le: cree_le ?? this.cree_le,
        envoyeur_id: envoyeur_id ?? this.envoyeur_id,
        groupe_id: groupe_id ?? this.groupe_id,
        id: id ?? this.id,
        message: message ?? this.message,
        modifie_le: modifie_le ?? this.modifie_le,
        recepteur_id: recepteur_id ?? this.recepteur_id);
  }

  factory Conversation.fromJson(Map<String, dynamic> json) {
    return Conversation(
        cree_le: json['cree_le'],
        envoyeur_id: json['envoyeur_id'],
        groupe_id: json['groupe_id'],
        id: json['id'],
        message: json['message'],
        modifie_le: json['modifie_le'],
        recepteur_id: json['recepteur_id']);
  }

  Map<String, dynamic> json() {
    return {
      'cree_le': cree_le,
      'envoyeur_id': envoyeur_id,
      'groupe_id': groupe_id,
      'id': id,
      'message': message,
      'modifie_le': modifie_le,
      'recepteur_id': recepteur_id
    };
  }
}
