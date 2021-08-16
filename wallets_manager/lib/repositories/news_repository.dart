// import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:wallets_manager/database/database_helper.dart';
import 'package:wallets_manager/dto/article_dto.dart';
import 'package:wallets_manager/dto/everthing_response.dart';
import 'package:wallets_manager/misc/mappers/network/dto_mapper.dart';
import 'package:wallets_manager/misc/mappers/database/dto_mapper.dart' as DB;
import 'package:wallets_manager/models/article.dart';
import 'package:wallets_manager/network/rest_client.dart';

class NewsRepository {
  final RestClient restClient;
  final DTOMapper<ArticleDTO, Article> newsMapper;
  final DB.DTOMapper<Article> articleMapper;
  final DatabaseHelper databaseHelper;
  // final Connectivity connectivity;

  NewsRepository(
      {@required this.restClient,
      @required this.newsMapper,
      @required this.databaseHelper,
      // @required this.connectivity,
      @required this.articleMapper});

  Future<List<Article>> news() async {
    // final connectivityResult = await connectivity.checkConnectivity();
    List<Article> articles;

    // if (connectivityResult == ConnectivityResult.none) {
      final List<Map<String, dynamic>> dbArticles =
          await databaseHelper.getArticles();

      articles = dbArticles.map((dbArticles) => articleMapper.toModel(dbArticles)).toList(growable: false);

    // } else {
    //   EverythingResponse response;
    //   try {
    //     response = await restClient.everything();
    //   } catch (error) {
    //     throw Error();
    //   }
    //
    //    articles = response.articles
    //       .map((dto) => newsMapper.toModel(dto))
    //       .toList(growable: false);
    //
    //   articles.forEach((article) {
    //     final dbArticle = articleMapper.toDTO(article);
    //     databaseHelper.insertArticle(dbArticle);
    //   });
    // }
      return articles;

  }
}
