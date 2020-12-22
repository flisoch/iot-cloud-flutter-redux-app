import 'package:flutter_app/models/app_state.dart';
import 'package:flutter_app/reducers/selected_device_reducer.dart';

import 'devices_reducer.dart';
import 'loading_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    isLoading: loadingReducer(state.isLoading, action),
    devices: devicesReducer(state.devices, action),
    selectedDevice: selectedDeviceReducer(state.selectedDevice, action),
  );
}
