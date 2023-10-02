import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyword_planner/data/remoute_data_source/base_data_source.dart';

import '../../../core/util/util.dart';
import '../../model/check_item.dart';
import '../base_bloc.dart';
import '../search_state.dart';

abstract class MainSearchBloc extends Cubit<GeneralState> implements BaseBloc {
  MainSearchBloc() : super(const GeneralState());
  
  bool get isAllSelected => checkedList.length == keywords.length;
  List<String> get checkedList {
    return keywords
        .toList()
        .where((element) => element.isChecked == true)
        .map((e) => e.keyword)
        .toList();
  }

  bool inprocessing = false;
  Set<CheckedItem> keywords = {};
  void getData(String keyword, BrowserType browserType);

  void callUsecase(String keyword, BrowserType browserType, dynamic api) async {
    keywords.clear();
    final alphabets = Util.checkInputType(keyword);

    if (isClosed) return;
    emit(const GeneralState(isLoading: true));
    inprocessing = true;

    for (var char in alphabets) {
      final result = await api.call(keyword + char, browserType);
      if (result.success != null) {
        for (var i in result.success!) {
          keywords.add(CheckedItem(false, i));
        }
        if (isClosed) return;
        emit(state);
        emit(GeneralState(keywords: []));
      } else {
        if (isClosed) return;
        emit(GeneralState(error: result.fail));
      }
    }
  
    inprocessing = false;
  }
}
