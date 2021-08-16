import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wallets_manager/models/article.dart';
import 'package:wallets_manager/repositories/news_repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {

  final NewsRepository newsRepository;

  NewsBloc({this.newsRepository}) : super(FetchingNewsState());

  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
    if(event is FetchNewsEvent) {
      yield FetchingNewsState();

      List<Article> articles;
      try{
        articles = await newsRepository.news();
      } catch (error){
        yield ErrorNewsState(error.toString());
      }

      if(articles != null) {
        if(articles.isNotEmpty){
          yield FetchedNewsState(articles);
        } else {
          yield NoNewsState();
        }
      } else {
        yield ErrorNewsState('Generic Error');
      }

    }
  }

  void fetchNews() => add(FetchNewsEvent());
}
