import 'package:flutter/material.dart';
import 'package:keyword_planner/presentation/controller/search_bloc/google_search_bloc.dart';
import 'package:keyword_planner/presentation/view/widgets/cubit_consumer.dart';

class GoogleSearchScreen extends StatelessWidget {
  const GoogleSearchScreen({super.key});

  @override
  Widget build(BuildContext context) => const CubitConsumer<GoogleSearchBloc>();
}
