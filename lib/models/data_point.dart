import 'package:flutter_app/models/device.dart';

class DeviceDataPoint {
  final Device device;
  final DateTime timestamp;
  final num temperature;

  DeviceDataPoint(
    this.device,
    this.timestamp,
    this.temperature,
  );
}
