class Brano {
  String titolo;
  String autore;
  String disco;
  int iDCanzone;

  Brano({this.titolo, this.autore, this.disco, this.iDCanzone});

  Brano.fromJson(Map<String, dynamic> json) {
    titolo = json['titolo'];
    autore = json['autore'];
    disco = json['disco'];
    iDCanzone = json['ID_canzone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titolo'] = this.titolo;
    data['autore'] = this.autore;
    data['disco'] = this.disco;
    data['ID_canzone'] = this.iDCanzone;
    return data;
  }
}
