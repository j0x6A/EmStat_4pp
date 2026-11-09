import 'package:flutter/material.dart';

import 'switches_view_model.dart';

class SwitchesView extends StatelessWidget {
  const SwitchesView({super.key, required this.viewModel});

  final SwitchesViewModel viewModel;

  @override
  Widget build(BuildContext c) => ListenableBuilder(
    listenable: viewModel,
    builder: (_, __) => Center(child: Text('Switches\n${viewModel.status}')),
  );
}
