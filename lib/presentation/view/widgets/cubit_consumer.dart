import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keyword_planner/core/util/responsive.dart';


import '../../controller/search_bloc/main_bloc.dart';
import '../../controller/search_state.dart';
import 'keyword_list_builder.dart';
import 'search_bar.dart';
import 'snackbar.dart';

ValueNotifier<bool> hiddenSearchBar = ValueNotifier(false);

class CubitConsumer<B extends MainSearchBloc> extends StatelessWidget {
  const CubitConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<B>();
    var searchBar = CustomSearchBar<B>(hiddenCustomSearchBar: hiddenSearchBar,);
    return Padding(
      padding: Responsive.isMobile(context)
          ? const EdgeInsets.all(5)
          : const EdgeInsets.all(10),
      child: Column(
        children: [
          searchBar,
          Expanded(
            child: BlocConsumer<B, GeneralState>(listener: (context, state) {
              if (state.error != null && bloc.keywords.isEmpty) {
                snackBar(
                    context: context,
                    title: 'Error',
                    message: state.error.toString());
              }
            }, builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (bloc.keywords.isNotEmpty) {
                switch (bloc.keywords.length) {
                  case == 0:
                    return const Center(
                      child: Icon(
                        FontAwesomeIcons.folderOpen,
                        size: 50,
                        color: Colors.grey,
                      ),
                    );
                  default:
                    return KeywordsListBuilder<B>(
                      keywords: bloc.keywords.toList(),
                      isHidden: hiddenSearchBar,
                    );
                }
              } else {
                return const Center(child: Text('No Data'));
              }
            }),
          ),
        ],
      ),
    );
  }
}

