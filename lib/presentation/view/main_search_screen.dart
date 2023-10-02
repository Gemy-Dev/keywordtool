import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyword_planner/locator.dart';
import 'package:keyword_planner/presentation/controller/search_bloc/amazon_search_bloc.dart';
import 'package:keyword_planner/presentation/controller/search_bloc/bing_search_bloc.dart';
import 'package:keyword_planner/presentation/controller/search_bloc/ebay_search_bloc.dart';
import 'package:keyword_planner/presentation/controller/search_bloc/google_search_bloc.dart';
import 'package:keyword_planner/presentation/controller/search_bloc/yahoo_search_bloc.dart';
import 'package:keyword_planner/presentation/controller/search_bloc/youtube_search_bloc.dart';
import 'package:keyword_planner/presentation/view/keyword_search/ebay_screen.dart';

import 'package:keyword_planner/presentation/view/widgets/search_tabs.dart';

import 'keyword_search/amazon_screen.dart';
import 'keyword_search/bing_screen.dart';
import 'keyword_search/google_screen.dart';
import 'keyword_search/yahoo_screen.dart';
import 'keyword_search/youtube_screen.dart';

class MainSearchScreen extends StatefulWidget {
  const MainSearchScreen({super.key});

  @override
  State<MainSearchScreen> createState() => _MainSearchScreenState();
}

class _MainSearchScreenState extends State<MainSearchScreen> {
  SearchEng currentEng =SearchEng.google;
  changeSearchEngin(SearchEng searchEng) {
    currentEng = searchEng;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
          "Keyword Search Suggestion",
          style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        SearchTaps(currentEng, changeSearchEngin),
        Expanded(child: searchEnginScreen())
      ],
    );
  }

  Widget searchEnginScreen() {
    switch (currentEng) {
      case SearchEng.google:
        return BlocProvider(
          create: (_) => sl<GoogleSearchBloc>(),
          child: const GoogleSearchScreen(),
        );
      case SearchEng.youtube:
        return BlocProvider(
          create: (context) => sl<YoutubeSearchBloc>(),
          child: const YoutubeSearchScreen(),
        );
      case SearchEng.bing:
        return BlocProvider(
          create: (context) => sl<BingSearchBloc>(),
          child: const BingScreen(),
        );
      case SearchEng.yahoo:
        return BlocProvider(
          create: (context) => sl<YahooSearchBloc>(),
          child: const YahooScreen(),
        );
      case SearchEng.amazon:
        return BlocProvider(
          create: (context) => sl<AmazonSearchBloc>(),
          child: const AmazonScreen(),
        );
      case SearchEng.ebay:
        return BlocProvider(
          create: (context) => sl<EbaySearchBloc>(),
          child: const EbaySearchScreen(),
        );

      default:
        return BlocProvider(
          create: (context) => sl<GoogleSearchBloc>(),
          child: const GoogleSearchScreen(),
        );
    }
  }
}
