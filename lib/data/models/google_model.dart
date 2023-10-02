import 'package:keyword_planner/domain/entity/google_entity.dart';

class GoogleModel extends GoogleEntity {
  GoogleModel(
      {required String keyword,
      required int countInTitle,
      required int countInArtical})
      : super(
            keyword: keyword,
            countInTitle: countInTitle,
            countInArtical: countInArtical);
}
