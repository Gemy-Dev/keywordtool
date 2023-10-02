import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/util/responsive.dart';
import '../../../data/remoute_data_source/base_data_source.dart';
import '../../controller/search_bloc/main_bloc.dart';
import 'cubit_consumer.dart';


class CustomSearchBar<B extends MainSearchBloc> extends StatefulWidget {
  const CustomSearchBar({
    required this.hiddenCustomSearchBar, 
  });

  final ValueNotifier<bool> hiddenCustomSearchBar;

  @override
  State<CustomSearchBar<B>> createState() => CustomSearchBarState<B>();
}

class CustomSearchBarState<B extends MainSearchBloc> extends State<CustomSearchBar<B>> {
  late TextEditingController controller;
  @override
  void initState() {
    hiddenSearchBar.value = false;
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<B>();
    return ValueListenableBuilder(
        valueListenable: widget.hiddenCustomSearchBar,
        builder: (context, value, child) => AnimatedContainer(
              height: !value ? 50 : 0,
              duration: Duration(milliseconds: 300),
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 200),
                opacity: !value ? 1 : 0,
                child: SearchBarWidget(
                    controller: controller,
                    callback: () =>
                        bloc.getData(controller.text, BrowserType.chrome)),
              ),
            ));
  }
}











class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({
    super.key,
    required this.controller,
    required this.callback,
  });
  final TextEditingController controller;
  final VoidCallback callback;

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 50,
              child: TextFormField(
                maxLines: 1,
                onChanged: (value) => setState(() {}),
                controller: widget.controller,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          TextButton.icon(
            icon: const Icon(FontAwesomeIcons.search),
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                fixedSize: Responsive.isMobile(context)
                    ? const Size(60, 50)
                    : const Size(120, 50),
                backgroundColor: Colors.grey[300]),
            label: !Responsive.isMobile(context)
                ? const Text('Search')
                : const Text(''),
            onPressed: widget.controller.text.trim().isNotEmpty
                ? () {
                    widget.callback();
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                : null,
          )
        ],
      ),
    );
  }
}
