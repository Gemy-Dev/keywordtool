import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyword_planner/presentation/controller/base_bloc.dart';
import 'package:keyword_planner/presentation/view/widgets/Custom_Container.dart';
import 'package:keyword_planner/presentation/view/widgets/snackbar.dart';

import '../../controller/search_bloc/main_bloc.dart';
import '../../model/check_item.dart';
import 'copy_button.dart';

class KeywordsListBuilder<B extends BaseBloc> extends StatefulWidget {
  const KeywordsListBuilder(
      {super.key, required this.keywords, required this.isHidden, this.title});
  final List<CheckedItem> keywords;
  final ValueNotifier<bool> isHidden;
  final String? title;
  @override
  State<KeywordsListBuilder<B>> createState() => KeywordsListBuilderState<B>();
}

class KeywordsListBuilderState<B extends BaseBloc>
    extends State<KeywordsListBuilder<B>> {
  final ScrollController controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    controller.addListener(() {
      if (controller.position.userScrollDirection == ScrollDirection.forward) {
        //  setState(() {});

        widget.isHidden.value = false;
      } else {
        widget.isHidden.value = true;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<B>();

    return Stack(
      children: [
        Container(
            margin: const EdgeInsets.all(5),
            //  padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Container(
                    width: double.maxFinite,
                    height: 40,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: Colors.grey.shade300),
                    child: Row(
                      children: [
                        Checkbox(
                            value: bloc.isAllSelected,
                            onChanged: (value) {
                              for (var item in widget.keywords) {
                                item.isChecked = value!;
                              }
                              setState(() {});
                            }),
                        Text(widget.title ?? "keywords"),
                        const Spacer(),
                        if (bloc.inprocessing)
                          SizedBox(
                            width: 20,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        SizedBox(
                          width: 20,
                        ),
                        CustomContainer(
                          child: Text(widget.keywords.length.toString()),
                        )
                      ],
                    )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                      controller: controller,
                      itemBuilder: (context, index) {
                        return StatefulBuilder(
                            builder: (context, stateBuilder) {
                          return Row(
                            children: [
                              Text(
                                "${index + 1} -",
                              ),
                              Checkbox(
                                  value: widget.keywords[index].isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      widget.keywords[index].isChecked = value!;
                                    });
                                  }),
                              Expanded(
                                child: Text(
                                  widget.keywords[index].keyword.toString(),
                                ),
                              ),
                            ],
                          );
                        });
                      },
                      separatorBuilder: (_, index) => const Divider(),
                      itemCount: widget.keywords.length),
                ))
              ],
            )),
        if (bloc.checkedList.length > 0)
          Positioned(
              bottom: 10,
              right: 10,
              child: CopyButton(
                callback: () async {
                  await Clipboard.setData(
                      ClipboardData(text: bloc.checkedList.join(", ")));
                  if (context.mounted) {
                    snackBar(
                        context: context,
                        title: "copy",
                        message: 'keywords copied');
                  }
                },
                copiedCount: bloc.checkedList.length,
              )),
      ],
    );
  }
}
