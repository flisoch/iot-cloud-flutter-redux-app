import 'package:flutter/material.dart';
import 'package:flutter_app/models/app_state.dart';
import 'package:flutter_app/models/device.dart';
import 'package:flutter_app/selectors/selectors.dart';
import 'package:redux/redux.dart';

class DeviceChartViewModel {
  final Device device;

  DeviceChartViewModel({
    @required this.device,
  });

  factory DeviceChartViewModel.from(Store<AppState> store) {
    final Device device = selectedDeviceSelector(store.state);
    return DeviceChartViewModel(
      device: device,
    );
  }
}