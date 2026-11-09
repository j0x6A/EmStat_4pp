import 'package:flutter/foundation.dart';

import '../../core/em_stat_device.dart';

class FourPpViewModel extends ChangeNotifier {
  FourPpViewModel({required this.emStatDevice});

  final EmStatDevice emStatDevice;

  String status = '4PP measurement is not configured.';
}
