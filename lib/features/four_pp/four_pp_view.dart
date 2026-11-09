import 'package:flutter/material.dart';

import 'four_pp_view_model.dart';

class FourPpView extends StatelessWidget {
  const FourPpView({super.key, required this.viewModel});

  final FourPpViewModel viewModel;

  @override
  Widget build(BuildContext c) => ListenableBuilder(
    listenable: viewModel,
    builder: (_, __) => Center(child: Text('4pp\n${viewModel.status}')),
  );
}
