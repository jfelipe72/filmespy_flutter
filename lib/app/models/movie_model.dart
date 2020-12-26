class MovieModel {
  String data;
  String genero;
  String link;
  String poster;
  String sinopse;
  String sinopseFull;
  String titulo;
  String isFavorite;

  MovieModel({
    this.data,
    this.genero,
    this.link,
    this.poster,
    this.sinopse,
    this.sinopseFull,
    this.titulo,
    this.isFavorite,
  });

  MovieModel.fromJson(Map<String, dynamic> json) {
    data = json['data'].toString().trim();
    genero = json['genero'].toString().trim();
    link = json['link'].toString().trim();
    poster = json['poster'].toString().trim();
    sinopse = json['sinopse'].toString().trim();
    sinopseFull = json['sinopseFull'].toString().trim();
    titulo = json['titulo'].toString().trim();
    isFavorite = json['isFavorite'].toString().trim();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['genero'] = this.genero;
    data['link'] = this.link;
    data['poster'] = this.poster;
    data['sinopse'] = this.sinopse;
    data['sinopseFull'] = this.sinopseFull;
    data['titulo'] = this.titulo;
    data['isFavorite'] = this.isFavorite;
    return data;
  }
}
