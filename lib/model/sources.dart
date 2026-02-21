class SourceResponse {
  String? status;
  List<Source>? sources;
  String ? code;
  String ? message;
   SourceResponse({this.status,this.sources,this.code,this.message});

  factory SourceResponse.fromJson(Map<String, dynamic> json) {
    return SourceResponse(
      status: json['status'],
      code : json['code'],
      message : json["message"],
      sources: json['sources'] != null
          ? List<Source>.from(
              json['sources'].map((e) => Source.fromJson(e)),
            )
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'sources': sources?.map((e) => e.toJson()).toList(),
    };
  }
}
class Source {
     String id;
  String name;
  String url;
  String description;
  String language;
  String country;
  String category;

  Source({
    required this.id,
    required this.name,
    required this.url,
    required this.description,
    required this.language,
    required this.country,
    required this.category,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      url: json['url'] ?? '',
      description: json['description'] ?? '',
      language: json['language'] ?? '',
      country: json['country'] ?? '',
      category: json['category'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'url': url,
      'description': description,
      'language': language,
      'country': country,
      'category': category,
    };
  }
}