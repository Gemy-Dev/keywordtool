import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyword_planner/core/util/responsive.dart';
import 'package:keyword_planner/locator.dart';
import 'package:keyword_planner/presentation/controller/youtube_details/youtube_details_bloc.dart';
import 'package:keyword_planner/presentation/view/main_search_screen.dart';
import 'package:keyword_planner/presentation/view/widgets/mobile_menu.dart';
import 'package:keyword_planner/presentation/view/widgets/side_menu_bar.dart';
import 'package:keyword_planner/core/util/colors.dart';

import 'youtube_tags/youtube_video_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget screens(int index) {
    switch (index) {
      case 0:
        return const MainSearchScreen();

      case 1:
        return BlocProvider(
          create: (context) => sl<YoutubeDetailsBloc>(),
          child: const YoutubeVideoDetailsScreen(),
        );
      default:
        return const MainSearchScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.grey,
      body: Responsive(
        ///////////////   desktop and tablet view     //////////////
        desktop: Center(
                child: Row(
                children: [
                const SideMenu(),
                //  _sideBarMenu(context),
                ValueListenableBuilder(
                    valueListenable: selectedIndex,
                    builder: (context, index, _) =>
                    Expanded(child: screens(selectedIndex.value))),
                        ],
                      ),
                    ),
        //////////////  Mobile view  /////////////////
        mobile: SafeArea(
                child: Column(
                children: [
                ValueListenableBuilder(
                  valueListenable: selectedIndex,
                  builder: (context, index, _) =>
                  Expanded(child: screens(selectedIndex.value))),
                ],
              ),
              ),
            ),
      bottomNavigationBar: Responsive.isMobile(context) ? MobileMenu() : null,
    );
  }
}
