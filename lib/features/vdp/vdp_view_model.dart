import 'package:flutter/foundation.dart';

import '../../core/em_stat_device.dart';

class VdpViewModel extends ChangeNotifier {
  VdpViewModel({required this.emStatDevice});

  final EmStatDevice emStatDevice;

  String status = 'vdP measurement is not configured.';
}
