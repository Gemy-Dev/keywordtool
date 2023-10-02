import 'package:keyword_planner/domain/entity/youtube_desatils_entity.dart';
import 'package:keyword_planner/domain/repository/keyword_search_repo.dart';
import 'package:keyword_planner/domain/repository/youtube_details_repo.dart';

class YoutubeDetailsUsecase {
  final YoutubeDetailsRepo repo;

  YoutubeDetailsUsecase(this.repo);

  Future<Either<YoutubeDetailsEntity>> call(String url) {
    return repo.getYoutubeVideoDetails(url);
  }
}
