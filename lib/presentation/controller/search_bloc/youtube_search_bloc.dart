
import 'package:keyword_planner/presentation/controller/search_bloc/main_bloc.dart';

import '../../../data/remoute_data_source/base_data_source.dart';

import '../../../domain/uscases/keyword_search/youtube_search_usecase.dart';

class YoutubeSearchBloc extends MainSearchBloc {
  YoutubeSearchBloc(this.youtube) ;

  final YoutubeKeywordSearchUsecase youtube;


   @override
  void getData(String keyword, BrowserType browserType) async {
   callUsecase(keyword, browserType, youtube);
  }
}
