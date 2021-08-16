import 'package:wallets_manager/dto/article_dto.dart';
import 'package:wallets_manager/dto/dto.dart';

class EverythingResponse extends DTO{
  final String status;
  final int totalResult;
  final List<ArticleDTO> articles;

  EverythingResponse({
     this.status,
     this.totalResult,
     this.articles,
  });

  factory EverythingResponse.fromJson(Map<String,dynamic> json) => EverythingResponse(
    status: json['status'],
    totalResult: json['totalResult'],
    articles: (json['articles'] as List).map((article) => ArticleDTO.fromJson(article)).toList(growable: false),
  );

  @override
  List<Object> get props => [
    status,
    totalResult,
    articles
  ];
}
