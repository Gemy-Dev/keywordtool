
import 'package:flutter/material.dart';

import 'package:keyword_planner/presentation/controller/search_bloc/youtube_search_bloc.dart';
import 'package:keyword_planner/presentation/view/widgets/cubit_consumer.dart';

class YoutubeSearchScreen extends StatelessWidget {
  const YoutubeSearchScreen({super.key});

  @override
  Widget build(BuildContext context) =>
     const CubitConsumer<YoutubeSearchBloc>();
  
}
