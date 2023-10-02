import 'package:keyword_planner/domain/repository/keyword_search_repo.dart';

import '../../../data/remoute_data_source/base_data_source.dart';

class EbaySearchUsecase {
  final KeywordSearchRepo repo;

  EbaySearchUsecase(this.repo);

  Future<Either<List<String>>> call(String keyword, BrowserType browserType)async =>
      repo.ebayKeywordSerach(keyword);
}
