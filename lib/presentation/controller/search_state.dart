import '../model/check_item.dart';

class GeneralState {
  final bool isLoading;
  final List<CheckedItem>? keywords;
  final String? error;
  final bool isCompleate;
  const GeneralState(
      {this.isLoading = false,
      this.keywords = const [],
      this.error,
      this.isCompleate = false});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeneralState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          keywords == other.keywords &&
          isCompleate == other.isCompleate &&
          error == other.error;

  @override
  int get hashCode =>
      keywords.hashCode |
      isCompleate.hashCode |
      isLoading.hashCode |
      keywords.hashCode |
      error.hashCode;
}
