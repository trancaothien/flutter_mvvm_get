class FilmModel {
  String? title;
  int? episodeId;
  String? openingCrawl;
  String? director;
  String? producer;
  String? releaseDate;
  List<String>? characters;
  List<String>? planets;
  List<String>? starships;
  List<String>? vehicles;
  List<String>? species;
  String? created;
  String? edited;
  String? url;

  FilmModel({
    this.title,
    this.episodeId,
    this.openingCrawl,
    this.director,
    this.producer,
    this.releaseDate,
    this.characters,
    this.planets,
    this.starships,
    this.vehicles,
    this.species,
    this.created,
    this.edited,
    this.url,
  });

  FilmModel.fromJson(dynamic json) {
    title = json['title'];
    episodeId = json['episode_id'];
    openingCrawl = json['opening_crawl'];
    director = json['director'];
    producer = json['producer'];
    releaseDate = json['release_date'];
    characters = List<String>.from(json["characters"].map((x) => x));
    planets = List<String>.from(json["planets"].map((x) => x));
    starships = List<String>.from(json["starships"].map((x) => x));
    vehicles = List<String>.from(json["vehicles"].map((x) => x));
    species = List<String>.from(json["species"].map((x) => x));
    created = json['created'];
    edited = json['edited'];
    url = json['url'];
  }
}
