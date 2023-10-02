import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/util/colors.dart';
import '../../../core/util/responsive.dart';

final selectedIndex = ValueNotifier<int>(0);

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return NavigationRail(
        leading: Row(
          children: [
            SizedBox(
            height: 70,
            child: Image.asset(
            'assets/icons/keyword suggestion tool.png',
            width: 40,
                )),
            !Responsive.isTablet(context)
              ? Text(
                'Keyword Suggestion Tool',
                style: Theme.of(context).textTheme.titleMedium,
                )
              : const SizedBox()
          ],
        ),
        backgroundColor: AppColor.white,
        //    backgroundColor: Colors.grey.shade300,
        extended: Responsive.isDesktop(context) ? true : false,
        // selectedLabelTextStyle: const TextStyle(fontSize: 20),
        indicatorShape: const StadiumBorder(),
        //
        //  unselectedLabelTextStyle: const TextStyle(color: Colors.black),
        destinations: const [
          NavigationRailDestination(
              icon: Icon(FontAwesomeIcons.searchengin),
              label: Text("Search Keyword")),
          NavigationRailDestination(
              icon: Icon(FontAwesomeIcons.youtube),
              label: Text(
                "Youtube Tags",
                //style: TextStyle(color: Colors.black),
              ))
        ],
        onDestinationSelected: (value) {
          setState(() {
            selectedIndex.value = value;
          });
        },
        // indicatorColor: Colors.amber,
        selectedIndex: selectedIndex.value);
  }
}
