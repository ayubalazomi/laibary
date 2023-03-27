import 'package:apiprojecttask/model/search_books_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../Model/recent_books_response.dart';


class BookProvider extends ChangeNotifier{

  Dio? dio;
  //List<BookProvider>? data;
  RecentBooksResponse?recentBooksResponse;
  SearchBooksResponse? kindBook;

  BookProvider(){
    print("posts provider constructor");
    dio = Dio(
        BaseOptions(
            contentType: "Application/json"
        )
    );
  }

  Future<void> getRecentBooks() async {
    print("get recent books called");
    var response = await dio?.get("https://www.dbooks.org/api/recent");
    print("response ${response}");
    recentBooksResponse = RecentBooksResponse.fromJson(response?.data);

    notifyListeners();
  }

  Future<void> getMoreBooks(String x) async {
    print("get recent books called");
    var response = await dio?.get("https://www.dbooks.org/api/search/$x");

    print("response ${response}");
    kindBook = SearchBooksResponse.fromJson(response?.data);

    notifyListeners();
  }

}