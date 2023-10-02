import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keyword_planner/presentation/view/widgets/side_menu_bar.dart';

class MobileMenu extends StatefulWidget {
  const MobileMenu({super.key});

  @override
  State<MobileMenu> createState() => _MobileMenuState();
}

class _MobileMenuState extends State<MobileMenu> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
        backgroundColor: Colors.transparent,
        height: 60,
        surfaceTintColor: Colors.green,
        destinations: [
      NavigationDestination(
        icon: Icon(FontAwesomeIcons.getPocket),
        label: "Search Keyword",
        ),
      NavigationDestination(
        icon: Icon(FontAwesomeIcons.youtube),
        label: "Youtube Tags",
        )
      ],
      selectedIndex: selectedIndex.value,
      onDestinationSelected: (value) => setState(() {
      selectedIndex.value = value;
      }),
    );
  }
}
