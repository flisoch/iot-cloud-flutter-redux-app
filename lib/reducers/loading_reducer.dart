import 'package:flutter_app/actions/actions.dart';
import 'package:redux/redux.dart';

final loadingReducer = combineReducers<bool>([
  TypedReducer<bool, DevicesLoadedAction>(_setLoaded),
  TypedReducer<bool, DevicesNotLoadedAction>(_setLoaded),
  TypedReducer<bool, RefreshDevicesScreenAction>(_setLoading),
]);

bool _setLoaded(bool state, action) {
  return false;
}

bool _setLoading(bool state, action) {
  return true;
}
