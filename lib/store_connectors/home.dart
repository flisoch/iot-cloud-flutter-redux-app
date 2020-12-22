import 'package:flutter/material.dart';
import 'package:flutter_app/actions/actions.dart';
import 'package:flutter_app/store_connectors//viewModel/home_view_model.dart';
import 'package:flutter_app/models/app_state.dart';
import 'package:flutter_app/screens//devices_screen.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomeViewModel>(
      onInit: (store) {
        return store.dispatch(LoadDevicesAction());
      },
      converter: (Store<AppState> store) {
        return HomeViewModel.from(store);
      },
      builder: (context, vm) {
        return DevicesScreen(
          devices: vm.devices,
          isLoading: vm.isLoading,
          refreshScreen: vm.refreshScreen,
          selectDevice: vm.selectDevice,
          selectedDevice: vm.selectedDevice,
        );
      },
    );
  }
}
