import 'package:flutter/material.dart';
import 'package:wallets_manager/models/article.dart';

class ArticleWidget extends StatelessWidget {
  final Article article;

  const ArticleWidget(this.article, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
    title: Text(article.title),
    subtitle: Text(article.description),
    leading: Image.network(article.urlToImage),
  );
}
