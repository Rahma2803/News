import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/api_constants.dart';
import 'package:news/api/end_points.dart';
import 'package:news/model/news.dart';
import 'package:news/model/sources.dart';

class ApiManager {
  static Future<SourceResponse> getSources(String categoryID) async {
     Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.sourceApi,{
      "apiKey" : ApiConstants.apiKey,
      "category" : categoryID
     });
     try {
        var response = await http.get(url);
        var responseBody = response.body;
        var json = jsonDecode(responseBody);
        return SourceResponse.fromJson(json);
     }catch(e) {
        rethrow;
     } 
  }
  static Future<NewsResponse> getNews(
  String sourceId, {
  int page = 1,
  int pageSize = 10,
  String language = "en",
}) async {
  Uri url = Uri.https(
    ApiConstants.baseUrl,
    EndPoints.newsApi,
    {
      "apiKey": ApiConstants.apiKey,
      "sources": sourceId,
      "page": page.toString(),
      "pageSize": pageSize.toString(),
      "language": language,
    },
  );

  var response = await http.get(url);
  var json = jsonDecode(response.body);
  return NewsResponse.fromJson(json);
}
static Future<NewsResponse> searchNews(
  String query, {
  int page = 1,
  int pageSize = 10,
  String language = "en",
}) async {

  Uri url = Uri.https(
    ApiConstants.baseUrl,
    "/v2/everything",
    {
      "apiKey": ApiConstants.apiKey,
      "q": query,
      "page": page.toString(),
      "pageSize": pageSize.toString(),
      "language": language,
    },
  );

  var response = await http.get(url);
  var json = jsonDecode(response.body);

  return NewsResponse.fromJson(json);
}



}