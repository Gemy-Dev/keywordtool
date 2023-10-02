import 'package:keyword_planner/data/remoute_data_source/base_data_source.dart';
import 'package:keyword_planner/domain/repository/keyword_search_repo.dart';

class BingKeywordSearchUsecase {
  final KeywordSearchRepo keywordSearch;

  BingKeywordSearchUsecase(this.keywordSearch);
  Future<Either<List<String>>> call(
          String keyword, BrowserType browserType)async =>
      keywordSearch.bingKeywordSerach(keyword);
}
