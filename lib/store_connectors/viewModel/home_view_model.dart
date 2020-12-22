import 'package:flutter/material.dart';
import 'package:flutter_app/actions/actions.dart';
import 'package:flutter_app/models/app_state.dart';
import 'package:flutter_app/models/device.dart';
import 'package:flutter_app/selectors/selectors.dart';
import 'package:redux/redux.dart';

class HomeViewModel {
  final List<Device> devices;
  final bool isLoading;
  final Function refreshScreen;
  final Function selectDevice;
  final Device selectedDevice;

  HomeViewModel({
    @required this.devices,
    @required this.isLoading,
    @required this.refreshScreen,
    @required this.selectDevice,
    @required this.selectedDevice,
  });

  factory HomeViewModel.from(Store<AppState> store) {
    final List<Device> devices = devicesSelector(store.state);
    final bool isLoading = isLoadingSelector(store.state);
    final Device selectedDevice = selectedDeviceSelector(store.state);

    return HomeViewModel(
      devices: devices,
      isLoading: isLoading,
      selectedDevice: selectedDevice,
      refreshScreen: () {
        var action = RefreshDevicesScreenAction();
        store.dispatch(action);
        return action.completer.future;
      },
      selectDevice: (Device selectedDevice) {
        var action = ExpandDeviceAction(selectedDevice);
        store.dispatch(action);
        return action.completer.future;
      },
    );
  }
}
