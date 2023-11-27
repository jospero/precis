class Message {
  final String? id;
  final String? message;
  final String? sujet_id;
  final String? utilisateur_id;
  final DateTime? cree_le;
  final DateTime? modifie_le;
  Message(
      {this.cree_le,
      this.id,
      this.message,
      this.modifie_le,
      this.sujet_id,
      this.utilisateur_id});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
        cree_le: json['cree_le'],
        id: json['id'],
        message: json['message'],
        modifie_le: json['modifie_le'],
        sujet_id: json['sujet_id'],
        utilisateur_id: json['utilisateur_id']);
  }

  Message copyWith({
    String? id,
    String? message,
    String? sujet_id,
    String? utilisateur_id,
    DateTime? cree_le,
    DateTime? modifie_le,
  }) {
    return Message(
      cree_le: cree_le ?? this.cree_le,
      id: id ?? this.id,
      message: message ?? this.message,
      modifie_le: modifie_le ?? this.modifie_le,
      sujet_id: sujet_id ?? this.sujet_id,
      utilisateur_id: utilisateur_id ?? this.utilisateur_id,
    );
  }
}
