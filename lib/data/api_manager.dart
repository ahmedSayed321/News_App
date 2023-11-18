import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/sources_response.dart';
import 'package:news_app/model/articles_responce.dart';

 class ApiManager{

  static const baseUrl = 'newsapi.org';
  static const apiKey = '7d4bc7a7b683447a84aff57e16d985ff';



 static Future <SourcesResponseDM> getSource({String? id , String? searchKeyword}) async {
    Uri url = Uri.https(baseUrl, '/v2/top-headlines/sources',{
      "apiKey": apiKey,
      "category":id,
      "q":searchKeyword
    });

    http.Response response = await http.get(url);
    Map json = jsonDecode(response.body);
    SourcesResponseDM responseDM = SourcesResponseDM.fromJson(json);
    return responseDM;
  }
  static Future <ArticlesResponceDM> getArticle(
      {String? sourceId, String? searchKeyword, int? page}) async {
   Uri url = Uri.https(baseUrl, 'v2/everything',{
      "apiKey": apiKey,
      "sources": sourceId,
     "q": searchKeyword,
     "page": page.toString()
    });

    http.Response response = await http.get(url);
    Map json = jsonDecode(response.body);
   ArticlesResponceDM responseDM = ArticlesResponceDM.fromJson(json);
    return responseDM;
  }
}

































