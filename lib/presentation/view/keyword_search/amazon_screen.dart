import 'package:flutter/material.dart';
import 'package:keyword_planner/presentation/controller/search_bloc/amazon_search_bloc.dart';

import '../widgets/cubit_consumer.dart';

class AmazonScreen extends StatelessWidget {
  const AmazonScreen({super.key});

  @override
  Widget build(BuildContext context) => const CubitConsumer<AmazonSearchBloc>();
}
