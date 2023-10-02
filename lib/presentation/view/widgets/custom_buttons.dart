import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.title,
      required this.icon,
      required this.color,
      required this.isActive,
      required this.onTap,
      this.size});
  final String title;
  final IconData icon;
  final Color color;
  final bool isActive;
  final Function() onTap;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 7),
        decoration: BoxDecoration(
          border: isActive
              ? Border(
                  bottom:
                      BorderSide(color: Theme.of(context).focusColor, width: 2),
                )
              : null,
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(
            icon,
            color: isActive ? color : Colors.grey,
            size: size ?? 23,
          ),
          const SizedBox(
            width: 5,
          ),
          if (isActive) Text(title)
        ]),
      ),
    );
  }
}
