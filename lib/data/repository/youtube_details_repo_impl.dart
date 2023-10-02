import 'package:keyword_planner/core/errors/error.dart';
import 'package:keyword_planner/data/remoute_data_source/youtube_data_source.dart';
import 'package:keyword_planner/domain/entity/youtube_desatils_entity.dart';
import 'package:keyword_planner/domain/repository/keyword_search_repo.dart';
import 'package:keyword_planner/domain/repository/youtube_details_repo.dart';

class YoutubeDetailsRepoImpl implements YoutubeDetailsRepo {
  final YoutubeDataSource api;

  YoutubeDetailsRepoImpl(this.api);
  @override
  Future<Either<YoutubeDetailsEntity>> getYoutubeVideoDetails(
      String url) async {
    try {
      final result = await api.getYoutubeVideoDetails(url);
      return Either(success: result, fail: null);
    } on YoutubeUrlError {
      return Either(success: null, fail: 'Please Enter Valide Url');
    } catch (e) {
      return Either(success: null, fail: e.toString());
    }
  }
}
