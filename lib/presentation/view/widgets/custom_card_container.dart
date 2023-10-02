import 'package:flutter/material.dart';
import 'package:keyword_planner/core/util/colors.dart';
import 'package:keyword_planner/presentation/view/widgets/copy_button.dart';

class CustomCardContainer extends StatelessWidget {

  const CustomCardContainer(
      {super.key,
      required this.child,
      required this.title,
      required this.callback,
      required this.copiedCount});

  final Widget child;
  final String title;
  final VoidCallback callback;
  final int copiedCount;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.all(10),
      
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        ),
        child: Column(children: [
          Container(
              width: double.infinity,
              height: 40,
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20)),
              color: AppColor.greyDark),
              child: Row(
                children: [
                  Text(title),
                ],
              )),
          Expanded(
              child: Stack(
              children: [
              child,
              if (copiedCount != 0)
                Positioned(
                bottom: 10,
                right: 0,
                child: CopyButton(
                callback: callback, copiedCount: copiedCount))
            ],
          ))
        ]));
  }
}
