import 'usb_port.dart';

class EmStatDevice {
  EmStatDevice({required this.usbPort});

  final UsbPort usbPort;

  void dispose() {}
}
