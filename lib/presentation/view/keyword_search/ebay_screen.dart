import 'package:flutter/material.dart';
import 'package:keyword_planner/presentation/controller/search_bloc/ebay_search_bloc.dart';

import 'package:keyword_planner/presentation/view/widgets/cubit_consumer.dart';

class EbaySearchScreen extends StatelessWidget {
  const EbaySearchScreen({super.key});

  @override
  Widget build(BuildContext context) => const CubitConsumer<EbaySearchBloc>();
}
