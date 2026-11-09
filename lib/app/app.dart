import 'dart:ui' show AppExitResponse;

import 'package:flutter/material.dart';

import '../core/em_stat_device.dart';
import '../core/usb_port.dart';
import '../features/four_pp/four_pp_view.dart';
import '../features/four_pp/four_pp_view_model.dart';
import '../features/readme/readme_view.dart';
import '../features/readme/readme_view_model.dart';
import '../features/switches/switches_view.dart';
import '../features/switches/switches_view_model.dart';
import '../features/terminal/terminal_view.dart';
import '../features/terminal/terminal_view_model.dart';
import '../features/vdp/vdp_view.dart';
import '../features/vdp/vdp_view_model.dart';

class EmStatApp extends StatefulWidget {
  const EmStatApp({super.key});

  @override
  State<EmStatApp> createState() => _EmStatAppState();
}

class _EmStatAppState extends State<EmStatApp> {
  late final UsbPort _usbPort;
  late final EmStatDevice _emStatDevice;
  late final ReadmeViewModel _readme;
  late final TerminalViewModel _terminal;
  late final SwitchesViewModel _switches;
  late final FourPpViewModel _fourPp;
  late final VdpViewModel _vdp;
  late final AppLifecycleListener _lifecycle;
  bool _resourcesDisposed = false;

  @override
  void initState() {
    super.initState();
    _usbPort = UsbPort();
    _emStatDevice = EmStatDevice(usbPort: _usbPort);
    _readme = ReadmeViewModel();
    _terminal = TerminalViewModel(usbPort: _usbPort);
    _switches = SwitchesViewModel(emStatDevice: _emStatDevice);
    _fourPp = FourPpViewModel(emStatDevice: _emStatDevice);
    _vdp = VdpViewModel(emStatDevice: _emStatDevice);
    _lifecycle = AppLifecycleListener(
      onExitRequested: () async {
        _disposeResources();
        return AppExitResponse.exit;
      },
    );
  }

  void _disposeResources() {
    if (_resourcesDisposed) return;
    _resourcesDisposed = true;
    _vdp.dispose();
    _fourPp.dispose();
    _switches.dispose();
    _terminal.dispose();
    _readme.dispose();
    _emStatDevice.dispose();
    _usbPort.dispose();
  }

  @override
  void dispose() {
    _lifecycle.dispose();
    _disposeResources();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'EmStat 4PP',
    theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
    home: EmStatHomePage(
      readme: _readme,
      terminal: _terminal,
      switches: _switches,
      fourPp: _fourPp,
      vdp: _vdp,
    ),
  );
}

class EmStatHomePage extends StatefulWidget {
  const EmStatHomePage({
    super.key,
    required this.readme,
    required this.terminal,
    required this.switches,
    required this.fourPp,
    required this.vdp,
  });

  final ReadmeViewModel readme;
  final TerminalViewModel terminal;
  final SwitchesViewModel switches;
  final FourPpViewModel fourPp;
  final VdpViewModel vdp;

  @override
  State<EmStatHomePage> createState() => _EmStatHomePageState();
}

class _EmStatHomePageState extends State<EmStatHomePage>
    with SingleTickerProviderStateMixin {
  List<({String label, Widget child})> get _tabs => [
    (label: 'README', child: ReadmeView(viewModel: widget.readme)),
    (label: 'Terminal', child: TerminalView(viewModel: widget.terminal)),
    (label: 'Switches', child: SwitchesView(viewModel: widget.switches)),
    (label: '4pp', child: FourPpView(viewModel: widget.fourPp)),
    (label: 'vdP', child: VdpView(viewModel: widget.vdp)),
  ];
  late final TabController _tabsController = TabController(
    length: _tabs.length,
    vsync: this,
  );

  @override
  void dispose() {
    _tabsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('EmStat 4PP'),
      bottom: TabBar(
        controller: _tabsController,
        tabs: [for (final tab in _tabs) Tab(text: tab.label)],
      ),
    ),
    body: AnimatedBuilder(
      animation: _tabsController,
      builder: (context, _) => IndexedStack(
        index: _tabsController.index,
        children: [for (final tab in _tabs) tab.child],
      ),
    ),
  );
}
