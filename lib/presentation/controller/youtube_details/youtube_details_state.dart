
import '../../model/check_item.dart';

class YoutubeState {
  final bool isLoading;
  final ({String title, List<CheckedItem>tags})? data;
  final String? error;

  const YoutubeState({this.isLoading = false, this.data, this.error});
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is YoutubeState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          data == other.data &&
          error == other.error;

  @override
  int get hashCode => data.hashCode;
}
