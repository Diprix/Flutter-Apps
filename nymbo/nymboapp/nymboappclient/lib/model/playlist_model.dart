class PlaylistModel {
  String refUtente;
  String nome;
  String descrizione;

  PlaylistModel({this.refUtente, this.nome, this.descrizione});

  PlaylistModel.fromJson(Map<String, dynamic> json) {
    refUtente = json['ref_utente'];
    nome = json['nome'];
    descrizione = json['descrizione'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ref_utente'] = this.refUtente;
    data['nome'] = this.nome;
    data['descrizione'] = this.descrizione;
    return data;
  }
}
