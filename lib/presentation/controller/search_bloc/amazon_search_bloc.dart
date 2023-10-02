import '../../../data/remoute_data_source/base_data_source.dart';
import '../../../domain/uscases/keyword_search/amazon_search_usecase.dart';
import 'main_bloc.dart';

class AmazonSearchBloc extends MainSearchBloc {
  AmazonSearchBloc(this.amazon);

  final AmazonKeywordSearchUsecase amazon;
  
  @override
  void getData(String keyword, BrowserType browserType) async {
  callUsecase(keyword, browserType, amazon);
  }
}

