import 'package:keyword_planner/data/remoute_data_source/base_data_source.dart';

abstract class KeywordSearchRepo {
  Future<Either<List<String>>> googleKeywordSearch(String keyword);
  Future<Either<List<String>>> youtubeKeywordSearch(
      String keyword, BrowserType browserType);
  Future<Either<List<String>>> amazonKeywordSerach(String keyword);
  Future<Either<List<String>>> bingKeywordSerach(String keyword);
  Future<Either<List<String>>> yahooKeywordSerach(String keyword);
  Future<Either<List<String>>> ebayKeywordSerach(String keyword);
}

class Either<T> {
  final T? success;
  final String? fail;

  Either({required this.success, required this.fail});
}
