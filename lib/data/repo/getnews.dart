import 'package:assigment/model/newsResponse.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as response;

import '../../const/url.dart';
import '../api/error.dart';
import '../api/helpers.dart';

class NewSGettingRepository {
  Future<List<NewsResponse>> getNews(String newType) async {
    List<NewsResponse> newsList = [];
    Object newsResponse = await ApiBaseHelper().getHTTP("$getNewsEnd$newType");
    if (newsResponse is DioError || newsResponse is DioException) {
      return newsList;
    }

    response.Response newsAsaResponse = newsResponse as response.Response;
    final items = newsAsaResponse.data['data'].cast<Map<String, dynamic>>();
    newsList = items.map<NewsResponse>((json) {
      return NewsResponse.fromJson(json);
    }).toList();

    return newsList;
  }
}
