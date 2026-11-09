import 'package:flutter/material.dart';

import 'readme_view_model.dart';

class ReadmeView extends StatelessWidget {
  const ReadmeView({super.key, required this.viewModel});

  final ReadmeViewModel viewModel;

  @override
  Widget build(BuildContext c) => ListenableBuilder(
    listenable: viewModel,
    builder: (_, __) => Center(
      child: Text(
        'README\n\n${viewModel.description}',
        textAlign: TextAlign.center,
      ),
    ),
  );
}
