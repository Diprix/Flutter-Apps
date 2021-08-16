import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallets_manager/blocs/news/news_bloc.dart';
import 'package:wallets_manager/models/article.dart';
import 'package:wallets_manager/widgets/article_widget.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('News App'),
        ),
        body: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if(state is ErrorNewsState) {
              return _errorNewsState(state.error);
            } else if(state is FetchingNewsState) {
              return _loadingNeesState();
            } else if(state is NoNewsState) {
              return _noNewsState();
            } else if(state is FetchedNewsState) {
              return _list(state.articles);
            }
            return Container();
          },
        ),
      );

  Widget _errorNewsState(String error) => Center(
    child: Text(error),
  );

  Widget _noNewsState() => Center(
    child: Text('Non ci sono news'),
  );

  Widget _loadingNeesState() => Center(
    child: CircularProgressIndicator(),
  );

  Widget _list(List<Article> articles) => ListView.builder(itemBuilder: (context, index) => ArticleWidget(articles[index]), itemCount: articles.length,);
}
