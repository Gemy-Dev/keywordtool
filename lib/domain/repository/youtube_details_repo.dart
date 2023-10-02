import 'package:keyword_planner/domain/entity/youtube_desatils_entity.dart';

import 'keyword_search_repo.dart';

abstract class YoutubeDetailsRepo {
  Future<Either<YoutubeDetailsEntity>> getYoutubeVideoDetails(String url);
}
