import 'package:flutter/material.dart';
import 'package:flutter_app/routes.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'store_connectors//device_chart.dart';
import 'store_connectors//home.dart';
import 'models/app_state.dart';

class App extends StatelessWidget {
  final Store<AppState> store;

  const App({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Samsung Academy IoT App',
        theme: new ThemeData(primarySwatch: Colors.green),
        routes: {
          AppRoutes.home: (context) => Home(),
          AppRoutes.deviceChart: (context) => DeviceChart(),
        },
      ),
    );
  }
}
