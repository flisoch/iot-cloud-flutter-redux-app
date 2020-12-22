import 'package:flutter_app/actions/actions.dart';
import 'package:flutter_app/models/device.dart';
import 'package:redux/redux.dart';

final devicesReducer = combineReducers<List<Device>>([
  TypedReducer<List<Device>, AddDeviceAction>(_addDevice),
  TypedReducer<List<Device>, DeleteDeviceAction>(_deleteDevice),
  TypedReducer<List<Device>, UpdateDeviceAction>(_updateDevice),
  TypedReducer<List<Device>, DevicesLoadedAction>(_setLoadedDevices),
  TypedReducer<List<Device>, DevicesNotLoadedAction>(_setNoDevices),
]);

List<Device> _addDevice(List<Device> devices, AddDeviceAction action) {
  return List.from(devices)..add(action.device);
}

List<Device> _deleteDevice(List<Device> devices, DeleteDeviceAction action) {
  return devices.where((device) => device.id != action.id).toList();
}

List<Device> _updateDevice(List<Device> devices, UpdateDeviceAction action) {
  return devices
      .map((device) => device.id == action.id ? action.updatedDevice : device)
      .toList();
}

List<Device> _setLoadedDevices(
    List<Device> devices, DevicesLoadedAction action) {
  return action.devices;
}

List<Device> _setNoDevices(
    List<Device> devices, DevicesNotLoadedAction action) {
  return [];
}
