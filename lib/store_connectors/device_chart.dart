import 'package:flutter/material.dart';
import 'package:flutter_app/actions/actions.dart';
import 'package:flutter_app/store_connectors//viewModel/device_chart_view_model.dart';
import 'package:flutter_app/models/app_state.dart';
import 'package:flutter_app/models/device.dart';
import 'package:flutter_app/screens//DeviceChartPage.dart';
import 'package:flutter_app/selectors/selectors.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class DeviceChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DeviceChartViewModel>(
      converter: (Store<AppState> store) {
        return DeviceChartViewModel.from(store);
      },
      builder: (context, vm) {
        return DeviceChartScreen(vm.device);
      },
    );
  }
}

