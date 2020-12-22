import 'package:flutter_app/models/device.dart';

abstract class ReactiveDevicesRepository {
  Future<void> addNewDevice(Device device);

  Future<void> deleteDevice(List<String> idList);

  Stream<List<Device>> streamDevices();

  Future<List<Device>> devices();

  Future<void> updateDevice(Device device);
}
