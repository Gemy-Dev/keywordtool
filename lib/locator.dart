import 'package:get_it/get_it.dart';
import 'package:keyword_planner/data/remoute_data_source/remote_data_source.dart';
import 'package:keyword_planner/data/remoute_data_source/youtube_data_source.dart';
import 'package:keyword_planner/data/repository/keyword_serch_repo_impl.dart';
import 'package:keyword_planner/data/repository/youtube_details_repo_impl.dart';
import 'package:keyword_planner/domain/repository/keyword_search_repo.dart';
import 'package:keyword_planner/domain/repository/youtube_details_repo.dart';
import 'package:keyword_planner/domain/uscases/keyword_search/ebay_search_usecase.dart';
import 'package:keyword_planner/domain/uscases/youtube_details/youtube_details_usecase.dart';
import 'package:keyword_planner/presentation/controller/search_bloc/amazon_search_bloc.dart';
import 'package:keyword_planner/presentation/controller/search_bloc/bing_search_bloc.dart';
import 'package:keyword_planner/presentation/controller/search_bloc/ebay_search_bloc.dart';
import 'package:keyword_planner/presentation/controller/search_bloc/google_search_bloc.dart';
import 'package:keyword_planner/presentation/controller/search_bloc/yahoo_search_bloc.dart';
import 'package:keyword_planner/presentation/controller/search_bloc/youtube_search_bloc.dart';
import 'package:keyword_planner/presentation/controller/youtube_details/youtube_details_bloc.dart';

import 'domain/uscases/keyword_search/amazon_search_usecase.dart';
import 'domain/uscases/keyword_search/bing_search_usecase.dart';
import 'domain/uscases/keyword_search/google_search_usecase.dart';
import 'domain/uscases/keyword_search/yahoo_search_usecase.dart';
import 'domain/uscases/keyword_search/youtube_search_usecase.dart';



final sl = GetIt.instance;
Future<void> init() async {
  /////////  Bloc Controller  ///////////////
  //sl.registerFactory(() => SearchBloc(sl<GoogleKeywordSearchUsecase>(), sl<YoutubeKeywordSearchUsecase>(), sl<AmazonKeywordSearchUsecase>(), sl<YahooKeywordSearchUsecase>(), sl<BingKeywordSearchUsecase>()));
  sl.registerFactory(() => GoogleSearchBloc(
        sl<GoogleKeywordSearchUsecase>(),
      ));
  sl.registerFactory(() => YoutubeSearchBloc(
        sl<YoutubeKeywordSearchUsecase>(),
      ));
  sl.registerFactory(() => BingSearchBloc(
        sl<BingKeywordSearchUsecase>(),
      ));
  sl.registerFactory(() => YahooSearchBloc(
        sl<YahooKeywordSearchUsecase>(),
      ));
  sl.registerFactory(() => AmazonSearchBloc(
        sl<AmazonKeywordSearchUsecase>(),
      ));
  sl.registerFactory(() => EbaySearchBloc(
        sl<EbaySearchUsecase>(),
      ));

      /////////////// youtube tags bloc //////////////////
  sl.registerFactory(() => YoutubeDetailsBloc(
        sl<YoutubeDetailsUsecase>(),
      ));
  

  ///////////// Usecases  ////////////////////////////
  sl.registerLazySingleton(
      () => YoutubeKeywordSearchUsecase(sl<KeywordSearchRepo>()));
  sl.registerLazySingleton(
      () => AmazonKeywordSearchUsecase(sl<KeywordSearchRepo>()));
  sl.registerLazySingleton(
      () => YahooKeywordSearchUsecase(sl<KeywordSearchRepo>()));
  sl.registerLazySingleton(
      () => BingKeywordSearchUsecase(sl<KeywordSearchRepo>()));

  sl.registerLazySingleton(
      () => GoogleKeywordSearchUsecase(sl<KeywordSearchRepo>()));
  sl.registerLazySingleton(
      () => EbaySearchUsecase(sl<KeywordSearchRepo>()));

      ///////////////////  Youtube details //////////////
  sl.registerLazySingleton(
      () => YoutubeDetailsUsecase(sl<YoutubeDetailsRepo>()));

  ////////// Reposatory  ///////////////
  sl.registerLazySingleton<KeywordSearchRepo>(
      () => KeywordSearchRepoImpl(sl()));

  sl.registerLazySingleton<YoutubeDetailsRepo>(
      () => YoutubeDetailsRepoImpl(sl()));

  ////////// Data source api  //////////////////
  sl.registerLazySingleton(() => DataSourceImpl());
  sl.registerLazySingleton<YoutubeDataSource>(() => YoutubeDataSourceImpl());
}
