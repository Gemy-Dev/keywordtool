
import 'package:keyword_planner/domain/uscases/keyword_search/ebay_search_usecase.dart';
import 'package:keyword_planner/presentation/controller/search_bloc/main_bloc.dart';

import '../../../data/remoute_data_source/base_data_source.dart';


class EbaySearchBloc extends MainSearchBloc {
  EbaySearchBloc(this.ebay) ;

  final EbaySearchUsecase ebay;


   @override
  void getData(String keyword, BrowserType browserType) async {
   callUsecase(keyword, browserType, ebay);
  }
}
