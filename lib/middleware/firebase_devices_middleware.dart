import 'package:flutter_app/actions/actions.dart';
import 'package:flutter_app/models/app_state.dart';
import 'package:flutter_app/models/device.dart';
import 'package:flutter_app/repository/reactive_repository/devices_repository_reactive.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';

List<Middleware<AppState>> createStoreDevicesMiddleware(
  ReactiveDevicesRepository repository,
) {
  return [
    TypedMiddleware<AppState, LoadDevicesAction>(
      _firestoreConnect(repository),
    ),
    TypedMiddleware<AppState, RefreshDevicesScreenAction>(
      _firestoreConnect(repository),
    ),
    TypedMiddleware<AppState, AddDeviceAction>(
      _firestoreSaveNewDevice(repository),
    ),
    TypedMiddleware<AppState, DeleteDeviceAction>(
      _firestoreDeleteDevice(repository),
    ),
    TypedMiddleware<AppState, UpdateDeviceAction>(
      _firestoreUpdateDevice(repository),
    ),
    new LoggingMiddleware.printer(formatter: logStateFormatter),
  ];
}

String logStateFormatter<State>(
    AppState state, dynamic action, DateTime timestamp) {
  List<Device> devices = state.devices;
  bool isLoading = state.isLoading;
  return "{Action: $action, State: {Devices: $devices, IsLoading: $isLoading}, ts: $timestamp}";
}

Middleware<AppState> _firestoreConnect(ReactiveDevicesRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);
    repository.devices().then((devices) {
      store.dispatch(DevicesLoadedAction(devices.toList()));
    }).catchError((_) => store.dispatch(DevicesNotLoadedAction()));
  };
}

Middleware<AppState> _firestoreStreamConnect(
    ReactiveDevicesRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);
    repository.streamDevices().listen((devices) {
      store.dispatch(DevicesLoadedAction(devices.toList()));
    }).onError((e) => store.dispatch(DevicesNotLoadedAction()));
  };
}

Middleware<AppState> _firestoreSaveNewDevice(
    ReactiveDevicesRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    repository.addNewDevice(
      action.device,
    );
  };
}

Middleware<AppState> _firestoreDeleteDevice(
    ReactiveDevicesRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    repository.deleteDevice(
      [action.id],
    );
  };
}

Middleware<AppState> _firestoreUpdateDevice(
    ReactiveDevicesRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    repository.updateDevice(
      action.device,
    );
  };
}
