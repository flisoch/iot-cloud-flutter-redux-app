import 'package:flutter_app/actions/actions.dart';
import 'package:flutter_app/models/device.dart';
import 'package:redux/redux.dart';

final selectedDeviceReducer = combineReducers<Device>([
  TypedReducer<Device, ExpandDeviceAction>(_setSelectedDevice),
]);

Device _setSelectedDevice(Device device, action) {
  return action.deviceToExpand;
}
