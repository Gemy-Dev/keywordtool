import 'package:keyword_planner/presentation/controller/search_bloc/main_bloc.dart';

import '../../../data/remoute_data_source/base_data_source.dart';

import '../../../domain/uscases/keyword_search/google_search_usecase.dart';

class GoogleSearchBloc extends MainSearchBloc {
  GoogleSearchBloc(this.google);

  final GoogleKeywordSearchUsecase google;

  @override
  void getData(String keyword, BrowserType browserType) =>
      callUsecase(keyword, browserType, google);
}
