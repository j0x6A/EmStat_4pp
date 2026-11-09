import 'package:flutter/material.dart';

import 'vdp_view_model.dart';

class VdpView extends StatelessWidget {
  const VdpView({super.key, required this.viewModel});

  final VdpViewModel viewModel;

  @override
  Widget build(BuildContext c) => ListenableBuilder(
    listenable: viewModel,
    builder: (_, __) => Center(child: Text('vdP\n${viewModel.status}')),
  );
}
