import '../model/check_item.dart';

abstract class BaseBloc {
  bool get isAllSelected => checkedList.length == keywords.length;
  List<String> get checkedList;

  bool inprocessing = false;
  Set<CheckedItem> keywords = {};
}
