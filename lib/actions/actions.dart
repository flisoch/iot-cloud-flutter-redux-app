import 'dart:async';

import 'package:flutter_app/models/device.dart';

class LoadDevicesAction {}

class DevicesLoadedAction {
  final List<Device> devices;

  DevicesLoadedAction(this.devices);

  @override
  String toString() {
    return 'DevicesLoadedAction{devices: $devices}';
  }
}

class DevicesNotLoadedAction {}

class UpdateDeviceAction {
  final String id;
  final Device updatedDevice;

  UpdateDeviceAction(this.id, this.updatedDevice);

  @override
  String toString() {
    return 'UpdateDeviceAction{id: $id, updatedDevice: $updatedDevice}';
  }
}

class DeleteDeviceAction {
  final String id;

  DeleteDeviceAction(this.id);

  @override
  String toString() {
    return 'DeleteDeviceAction{id: $id}';
  }
}

class AddDeviceAction {
  final Device device;

  AddDeviceAction(this.device);

  @override
  String toString() {
    return 'AddDeviceAction{Device: $device}';
  }
}

class ExpandDeviceAction {
  final Device deviceToExpand;
  final Completer<Null> completer;

  ExpandDeviceAction(this.deviceToExpand, {Completer completer})
      : this.completer = completer ?? Completer<Null>();

  @override
  String toString() {
    return 'ExpandDeviceAction{expandedDevice: $deviceToExpand}';
  }
}

class SeeChartsAction {}

class ToggleDayViewAction {}

class ToggleWeekViewAction {}

class ToggleMonthViewAction {}

class RefreshDevicesScreenAction {
  final Completer<Null> completer;

  RefreshDevicesScreenAction({Completer completer})
      : this.completer = completer ?? Completer<Null>();
}

class RefreshChartsScreenAction {}
