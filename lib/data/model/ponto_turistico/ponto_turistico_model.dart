class PontoTuristicoModel {

  int? id;
  String? nome;
  String? descricao;
  double? latitude;
  double? longitude;

  PontoTuristicoModel({ this.id, this.nome, this.descricao, this.latitude, this.longitude });

  PontoTuristicoModel.fromJson(Map<String, dynamic> json){
      this.id = json['id'];
      this.nome = json['nome'];
      this.descricao = json['descricao'];
      this.latitude = json['latitude'];
      this.longitude = json['longitude'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['descricao'] = this.descricao;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}