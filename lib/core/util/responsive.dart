import 'package:flutter/material.dart';

//Mobile: max-width: 480px
//Tablet: min-width: 481px and max-width: 1024px
//Desktop: min-width: 1025px
const int small = 480;
const int larg = 1025;

class Responsive extends StatelessWidget {
  const Responsive(
      {super.key, required this.desktop, this.tablet, required this.mobile});
  final Widget desktop;
  final Widget? tablet;
  final Widget mobile;

  static bool isMobile(context) => MediaQuery.of(context).size.width <= small;

  static bool isTablet(context) =>
      MediaQuery.of(context).size.width < larg &&

      MediaQuery.of(context).size.width > small;

  static bool isDesktop(context) => MediaQuery.of(context).size.width >= larg;

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    if (width <= small) {
      return mobile;
    } else if (width < larg && tablet != null)
      // ignore: curly_braces_in_flow_control_structures
      return tablet!;

    else
      // ignore: curly_braces_in_flow_control_structures
      return desktop;
  }
}
