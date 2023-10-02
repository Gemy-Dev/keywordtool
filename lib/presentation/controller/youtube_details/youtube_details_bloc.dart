import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyword_planner/domain/uscases/youtube_details/youtube_details_usecase.dart';
import 'package:keyword_planner/presentation/controller/base_bloc.dart';
import 'package:keyword_planner/presentation/controller/youtube_details/youtube_details_state.dart';
import 'package:keyword_planner/presentation/model/check_item.dart';

class YoutubeDetailsBloc extends Cubit<YoutubeState> implements BaseBloc {
  YoutubeDetailsBloc(this.youtube) : super(const YoutubeState());
  final YoutubeDetailsUsecase youtube;

  bool inprocessing = false;

  List<String> get checkedList {
    return keywords
        .toList()
        .where((element) => element.isChecked == true)
        .map((e) => e.keyword)
        .toList();
  }

  bool get isAllSelected => checkedList.length == keywords.length;

  String? title;
  // List get selectedTags => keywords
  //     .where((element) => element.isChecked == true)
  //     .map((e) => e.keyword)
  //     .toList();

  Set<CheckedItem> keywords = {};
  void getYoutubeVideoDetails(String url) async {
    emit(const YoutubeState(isLoading: true));
    inprocessing = true;
    final result = await youtube(url);

    if (result.success != null) {
      title = result.success!.title;
      keywords = result.success!.tags
          .map(
            (e) => CheckedItem(false, e),
          )
          .toSet();
      emit(state);
      emit(YoutubeState(data: result.success!.data()));
    } else {
      emit(YoutubeState(error: result.fail));
    }
    inprocessing = false;
  }
}
