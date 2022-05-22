import 'platforms_model.dart';

class GameDetails {
  int? id;
  String? slug;
  String? name;
  int? metacritic;
  String? released;
  bool? tba;
  String? backgroundImage;
  List<ParentPlatforms>? parentPlatforms;
  List<Genres>? genres;
  List<Publishers>? publishers;
  Platform? esrbRating;
  String? descriptionRaw;

  GameDetails(
      {this.id,
      this.slug,
      this.name,
      this.metacritic,
      this.released,
      this.tba,
      this.backgroundImage,
      this.parentPlatforms,
      this.genres,
      this.publishers,
      this.esrbRating,
      this.descriptionRaw});

  GameDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    name = json['name'];
    metacritic = json['metacritic'];
    released = json['released'];
    tba = json['tba'];
    backgroundImage = json['background_image'];
    if (json['parent_platforms'] != null) {
      parentPlatforms = <ParentPlatforms>[];
      json['parent_platforms'].forEach((v) {
        parentPlatforms!.add(ParentPlatforms.fromJson(v));
      });
    }
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(Genres.fromJson(v));
      });
    }
    if (json['publishers'] != null) {
      publishers = <Publishers>[];
      json['publishers'].forEach((v) {
        publishers!.add(Publishers.fromJson(v));
      });
    }
    esrbRating = json['esrb_rating'] != null
        ? Platform.fromJson(json['esrb_rating'])
        : null;
    descriptionRaw = json['description_raw'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['name'] = name;
    data['metacritic'] = metacritic;
    data['released'] = released;
    data['tba'] = tba;
    data['background_image'] = backgroundImage;
    if (parentPlatforms != null) {
      data['parent_platforms'] =
          parentPlatforms!.map((v) => v.toJson()).toList();
    }
    if (genres != null) {
      data['genres'] = genres!.map((v) => v.toJson()).toList();
    }
    if (publishers != null) {
      data['publishers'] = publishers!.map((v) => v.toJson()).toList();
    }
    if (esrbRating != null) {
      data['esrb_rating'] = esrbRating!.toJson();
    }
    data['description_raw'] = descriptionRaw;
    return data;
  }
}



class Genres {
  int? id;
  String? name;
  String? slug;
  int? gamesCount;
  String? imageBackground;

  Genres(
      {this.id, this.name, this.slug, this.gamesCount, this.imageBackground});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    gamesCount = json['games_count'];
    imageBackground = json['image_background'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['games_count'] = gamesCount;
    data['image_background'] = imageBackground;
    return data;
  }
}

class Publishers {
  int? id;
  String? name;
  String? slug;
  int? gamesCount;
  String? imageBackground;

  Publishers(
      {this.id, this.name, this.slug, this.gamesCount, this.imageBackground});

  Publishers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    gamesCount = json['games_count'];
    imageBackground = json['image_background'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['games_count'] = gamesCount;
    data['image_background'] = imageBackground;
    return data;
  }
}