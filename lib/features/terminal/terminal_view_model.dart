import 'package:flutter/foundation.dart';

import '../../core/usb_port.dart';

class TerminalViewModel extends ChangeNotifier {
  TerminalViewModel({required this.usbPort});

  final UsbPort usbPort;

  String status = 'Disconnected';
}
