import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keyword_planner/presentation/view/widgets/Custom_Container.dart';

import '../../../core/util/colors.dart';

class CopyButton extends StatelessWidget {
  const CopyButton(
      {super.key, required this.callback, required this.copiedCount});
  final VoidCallback callback;
  final int copiedCount;
  @override
  Widget build(BuildContext context) {
    return Stack(
          children: [
          Padding(
          padding: const EdgeInsets.all(5.0),
          child: FloatingActionButton(
          mini: true,
          backgroundColor: AppColor.primary,
          onPressed: callback,
          child: const Icon(FontAwesomeIcons.copy),
          ),
        ),
        Positioned(
            bottom: -2,
            child: Stack(
            alignment: Alignment.center,
            children: [
        CustomContainer(
            radius: 40,
            child: Padding(
            padding: const EdgeInsets.all(1),
            child: CustomContainer(
            radius: 40,
            color: AppColor.brown,
            child: Text(
            copiedCount.toString(),
            style: const TextStyle(color: AppColor.white),
                )),
          ),
        ),
              ],
            ))
      ],
    );
  }
}
