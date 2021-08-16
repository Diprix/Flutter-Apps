import 'package:wallets_manager/dto/article_dto.dart';
import 'package:wallets_manager/misc/mappers/network/dto_mapper.dart';
import 'package:wallets_manager/models/article.dart';

class NewsMapper extends DTOMapper<ArticleDTO, Article> {
  @override
  ArticleDTO toDTO(Article object) => ArticleDTO(
      title: object.title,
      description: object.description,
      urlToImage: object.urlToImage);

  @override
  Article toModel(ArticleDTO object) => Article(
      title: object.title,
      description: object.description,
      urlToImage: object.urlToImage);
}
