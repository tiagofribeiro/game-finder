import 'platforms_model.dart';

class GameList {
  int? count;
  String? next;
  List<Results>? results;

  GameList(
      {this.count,
      this.next,
      this.results,
});

  GameList.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? id;
  String? slug;
  String? name;
  String? released;
  bool? tba;
  String? backgroundImage;
  int? metacritic;
  List<ParentPlatforms>? parentPlatforms;

  Results({
    this.id,
    this.slug,
    this.name,
    this.released,
    this.tba,
    this.backgroundImage,
    this.metacritic,
    this.parentPlatforms,
  });

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    name = json['name'];
    released = json['released'];
    tba = json['tba'];
    backgroundImage = json['background_image'];
    metacritic = json['metacritic'];
    if (json['parent_platforms'] != null) {
      parentPlatforms = <ParentPlatforms>[];
      json['parent_platforms'].forEach((v) {
        parentPlatforms!.add(ParentPlatforms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['name'] = name;
    data['released'] = released;
    data['tba'] = tba;
    data['background_image'] = backgroundImage;
    data['metacritic'] = metacritic;
    if (parentPlatforms != null) {
      data['parent_platforms'] =
          parentPlatforms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}