import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keyword_planner/presentation/controller/youtube_details/youtube_details_bloc.dart';
import 'package:keyword_planner/presentation/view/widgets/cubit_consumer.dart';
import 'package:keyword_planner/presentation/view/widgets/custom_card_container.dart';
import 'package:keyword_planner/presentation/view/widgets/keyword_list_builder.dart';
import 'package:keyword_planner/presentation/view/widgets/search_bar.dart';
import 'package:keyword_planner/presentation/view/widgets/snackbar.dart';

import '../../controller/youtube_details/youtube_details_state.dart';

class YoutubeVideoDetailsScreen extends StatefulWidget {
  const YoutubeVideoDetailsScreen({super.key});

  @override
  State<YoutubeVideoDetailsScreen> createState() =>
      _YoutubeVideoDetailsScreenState();
}

class _YoutubeVideoDetailsScreenState extends State<YoutubeVideoDetailsScreen> {
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
    log('diapose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<YoutubeDetailsBloc>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Youtube Tags Extractor ",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        SearchBarWidget(
            controller: controller,
            callback: () {
              bloc.getYoutubeVideoDetails(controller.text);
            }),
        Expanded(
          child: BlocConsumer<YoutubeDetailsBloc, YoutubeState>(
              listener: (BuildContext context, YoutubeState state) {
            if (state.error != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error.toString())));
            }
          }, builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (bloc.keywords.isNotEmpty) {
              final data = state.data;

              return Column(children: [
                SizedBox(
                  height: 120,
                  width: double.infinity,
                  child: CustomCardContainer(
                    title: "Video Title",
                    copiedCount: 1,
                    callback: () async {
                      await Clipboard.setData(ClipboardData(text: data.title));
                      if (context.mounted) {
                        snackBar(
                            context: context,
                            title: "copy",
                            message: 'Title copied');
                      }
                    },
                    child: SizedBox(
                        width: double.infinity, child: Text(data!.title)),
                  ),
                ),
                Expanded(
                    child:
                        //     CustomCardContainer(
                        // titleLarge: "Video Tag",
                        // copiedCount: bloc.selectedTags.length,
                        // callback: () async {
                        //   await Clipboard.setData(
                        //       ClipboardData(text: bloc.selectedTags.join(', ')));
                        //   if (context.mounted) {
                        //     snackBar(context: context,title: "copy", message: 'Tags copied');
                        //   }
                        // },
                        // child: data.tags.isEmpty
                        //     ? const Center(
                        //         child: Text('No Tags Found'),
                        //       )
                        //     : Padding(
                        //         padding: const EdgeInsets.all(8.0),
                        //         child: ListView.separated(
                        //             itemBuilder: (context, index) {
                        //               return Row(
                        //                 children: [
                        //                   Text(
                        //                     "${index + 1} -",
                        //                   ),
                        //                   Checkbox(
                        //                       value: bloc.tags[index].isChecked,
                        //                       onChanged: (value) {
                        //                         setState(() {
                        //                           bloc.tags[index].isChecked =
                        //                               value!;
                        //                         });
                        //                       }),
                        //                   Expanded(
                        //                     child: Text(
                        //                       data.tags[index].keyword.toString(),
                        //                     ),
                        //                   ),
                        //                 ],
                        //               );
                        //             },
                        //             separatorBuilder: (_, index) => const Divider(),
                        //             itemCount: data.tags.length),
                        //       ),
                        // ),
                        //   ),
                        KeywordsListBuilder<YoutubeDetailsBloc>(
                  keywords: bloc.keywords.toList(),
                  isHidden: hiddenSearchBar,
                  title: "Tags",
                )),
              ]);
            } else
              return const Center(
                child: Icon(
                  FontAwesomeIcons.folderOpen,
                  size: 50,
                  color: Colors.grey,
                ),
              );
          }),
        ),
      ],
    );
  }
}
