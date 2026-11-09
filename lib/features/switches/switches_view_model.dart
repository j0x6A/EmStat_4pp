import 'package:flutter/foundation.dart';

import '../../core/em_stat_device.dart';

class SwitchesViewModel extends ChangeNotifier {
  SwitchesViewModel({required this.emStatDevice});

  final EmStatDevice emStatDevice;

  String status = 'Switch control is not connected.';
}
