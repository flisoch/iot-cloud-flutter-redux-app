import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app.dart';
import 'package:flutter_app/models/app_state.dart';
import 'package:flutter_app/reducers/app_reducer.dart';
import 'package:flutter_app/repository/reactive_repository/devices_repository_firestore.dart';
import 'package:redux/redux.dart';

import 'middleware/firebase_devices_middleware.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new App(
    store: Store<AppState>(
      appReducer,
      initialState: AppState.initial(),
      middleware: createStoreDevicesMiddleware(
          FirestoreReactiveDevicesRepository(FirebaseFirestore.instance)),
    ),
  ));
}
