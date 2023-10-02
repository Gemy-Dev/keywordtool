import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_buttons.dart';

class SearchTaps extends StatelessWidget {
  const SearchTaps(this.currentEng, this.onTap, {super.key});
  final SearchEng currentEng;
  final Function(SearchEng eng) onTap;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        CustomButton(
          title: "Google",
          color: Colors.green,
          icon: FontAwesomeIcons.google,
          isActive: currentEng == SearchEng.google,
          onTap: () => onTap(SearchEng.google),
        ),
        CustomButton(
          title: "Youtube",
          color: Colors.red,
          icon: FontAwesomeIcons.youtube,
          isActive: currentEng == SearchEng.youtube,
          onTap: () => onTap(SearchEng.youtube),
        ),
        CustomButton(
          title: "Bing",
          color: Colors.blue,
          icon: FontAwesomeIcons.edge,
          isActive: currentEng == SearchEng.bing,
          onTap: () => onTap(SearchEng.bing),
        ),
        CustomButton(
          title: "Yahoo",
          color: Colors.purple,
          icon: FontAwesomeIcons.yahoo,
          isActive: currentEng == SearchEng.yahoo,
          onTap: () => onTap(SearchEng.yahoo),
        ),
        CustomButton(
          title: "Amazon",
          color: Colors.black,
          icon: FontAwesomeIcons.amazon,
          isActive: currentEng == SearchEng.amazon,
          onTap: () => onTap(SearchEng.amazon),
        ),
        CustomButton(
          title: "",
          color: Colors.green,
          icon: FontAwesomeIcons.ebay,
          isActive: currentEng == SearchEng.ebay,
          size: 25,
          onTap: () => onTap(SearchEng.ebay),
        ),
      ],
    );
  }
}

enum SearchEng {
  google,
  youtube,
  bing,
  yahoo,
  amazon,
  ebay,
}
