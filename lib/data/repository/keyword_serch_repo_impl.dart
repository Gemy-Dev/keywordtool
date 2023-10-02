import 'package:keyword_planner/core/errors/error.dart';
import 'package:keyword_planner/data/remoute_data_source/base_data_source.dart';
import 'package:keyword_planner/data/remoute_data_source/remote_data_source.dart';
import 'package:keyword_planner/domain/repository/keyword_search_repo.dart';

class KeywordSearchRepoImpl implements KeywordSearchRepo {
  final DataSourceImpl api;

  KeywordSearchRepoImpl(this.api);
  @override
  Future<Either<List<String>>> googleKeywordSearch(String keyword) async =>
      _resultOrFailure(api.googleKeywordSearch(keyword, BrowserType.chrome));

  @override
  Future<Either<List<String>>> youtubeKeywordSearch(
          String keyword, BrowserType browserType) async =>
      _resultOrFailure(api.youtubeKeywordSearch(keyword, browserType));

  @override
  Future<Either<List<String>>> amazonKeywordSerach(String keyword) =>
      _resultOrFailure(api.amazonKeywordSerach(keyword));

  @override
  Future<Either<List<String>>> bingKeywordSerach(String keyword) async =>
      _resultOrFailure(api.bingKeywordSerach(keyword));

  @override
  Future<Either<List<String>>> yahooKeywordSerach(String keyword) async =>
      _resultOrFailure(api.yahooKeywordSerach(keyword));

// Custom function retrun Either on success that return List<String> Or on Fail return String Error
  @override
  Future<Either<List<String>>> ebayKeywordSerach(String keyword) async =>
      _resultOrFailure(api.ebayKeywordSerach(keyword));

  Future<Either<List<String>>> _resultOrFailure(
      Future<List<String>> api) async {
    try {
      final result = await api;
      return Either(success: result, fail: null);
    } on StatusCodeException catch (e) {
      return Either(success: null, fail: 'Error Type: ${e.toString()}');
    } on ClientErrorException catch (e) {
      return Either(success: null, fail: e.toString());
    }
  }
}
