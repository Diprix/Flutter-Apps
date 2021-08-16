// import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallets_manager/blocs/news/news_bloc.dart';
import 'package:wallets_manager/database/database_helper.dart';
import 'package:wallets_manager/misc/mappers/database/article_mapper.dart';
import 'package:wallets_manager/misc/mappers/network/news_mapper.dart';
import 'package:wallets_manager/network/rest_client.dart';
import 'package:wallets_manager/pages/home.dart';
import 'package:wallets_manager/repositories/news_repository.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MultiRepositoryProvider(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => NewsBloc(
                newsRepository: context.read<NewsRepository>(),
              )..fetchNews(),
            ),
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: Home(),
          ),
        ),
        providers: [
          RepositoryProvider(create: (_) => DatabaseHelper()),
          RepositoryProvider(
            create: (context) => NewsRepository(
              restClient: RestClient(),
              newsMapper: NewsMapper(),
              articleMapper: ArticleMapper(),
              databaseHelper: context.read<DatabaseHelper>(),
              // connectivity: Connectivity(),
            ),
          ),
        ],
      );
}
