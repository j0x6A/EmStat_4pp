import 'package:flutter/material.dart';

import 'terminal_view_model.dart';

class TerminalView extends StatelessWidget {
  const TerminalView({super.key, required this.viewModel});

  final TerminalViewModel viewModel;

  @override
  Widget build(BuildContext c) => ListenableBuilder(
    listenable: viewModel,
    builder: (_, __) => Center(child: Text('Terminal\n${viewModel.status}')),
  );
}
