import 'package:wallets_manager/dto/dto.dart';

class ArticleDTO extends DTO {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishetAt;
  final String content;

  ArticleDTO({
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishetAt,
    this.content,
  });

  factory ArticleDTO.fromJson(Map<String, dynamic> json) => ArticleDTO(
        title: json['title'],
        description: json['description'],
        url: json['url'],
        urlToImage: json['urlToImage'],
      );

  @override
  List<Object> get props => [
        title,
        description,
        url,
        urlToImage,
        publishetAt,
        content,
      ];
}
