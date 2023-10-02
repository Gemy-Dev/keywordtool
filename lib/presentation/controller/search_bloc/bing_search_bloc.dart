import 'package:keyword_planner/presentation/controller/search_bloc/main_bloc.dart';

import '../../../data/remoute_data_source/base_data_source.dart';

import '../../../domain/uscases/keyword_search/bing_search_usecase.dart';


class BingSearchBloc extends MainSearchBloc {
  BingSearchBloc(this.bing);

  final BingKeywordSearchUsecase bing;

@override
 void getData(String keyword, BrowserType browserType) async {
   callUsecase(keyword, browserType, bing);
  }
  
 
}
