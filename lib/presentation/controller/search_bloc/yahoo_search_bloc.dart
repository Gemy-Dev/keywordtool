
import 'package:keyword_planner/presentation/controller/search_bloc/main_bloc.dart';

import '../../../data/remoute_data_source/base_data_source.dart';
import '../../../domain/uscases/keyword_search/yahoo_search_usecase.dart';


class YahooSearchBloc extends MainSearchBloc {
  YahooSearchBloc(this.yahoo) ;


  final YahooKeywordSearchUsecase yahoo;

    @override
  void getData(String keyword, BrowserType browserType) async {
   callUsecase(keyword, browserType, yahoo);
  }
}
