import 'package:news/model/sources.dart';

class NewsResponse {
  String? status;
  int? totalResults;
  List<News>? articles;
  String ? code;
  String ? message;

  NewsResponse({
    this.status,
    this.totalResults,
    this.articles,
    this.code,
    this.message
  });

  NewsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    code = json['code'];
    message = json["message"];
    if (json['articles'] != null) {
      articles = List<News>.from(
        json['articles'].map((v) => News.fromJson(v)),
      );
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'totalResults': totalResults,
      'articles': articles?.map((v) => v.toJson()).toList(),
    };
  }
}

class News {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  News({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  News.fromJson(Map<String, dynamic> json) {
    source =
        json['source'] != null ? Source.fromJson(json['source']) : null;

    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    return {
      'source': source?.toJson(),
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    };
  }
}

