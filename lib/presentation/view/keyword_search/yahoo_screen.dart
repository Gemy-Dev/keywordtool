import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keyword_planner/presentation/controller/search_bloc/yahoo_search_bloc.dart';

import '../widgets/cubit_consumer.dart';

class YahooScreen extends StatelessWidget {
  const YahooScreen({super.key});

  @override
  Widget build(BuildContext context) => const CubitConsumer<YahooSearchBloc>();
}
