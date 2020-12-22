import 'package:flutter_app/models/chart_view_mode.dart';
import 'package:flutter_app/models/data_point.dart';
import 'package:flutter_app/models/device.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final bool isLoading;
  final List<Device> devices;
  final Device selectedDevice;
  final List<DeviceDataPoint> dataPoints;
  final ChartViewMode chartViewMode;

  AppState({
    this.isLoading = false,
    this.devices = const [],
    this.selectedDevice,
    this.chartViewMode,
    this.dataPoints = const [],
  });

  factory AppState.initial() =>
      AppState(isLoading: true, selectedDevice: Device.dummy());

  AppState copyWith({
    Device currentDevice,
    List<DeviceDataPoint> dataPoints,
    bool isLoading,
    List<Device> devices,
    ChartViewMode chartViewMode,
  }) {
    return AppState(
      isLoading: isLoading ?? this.isLoading,
      devices: devices ?? this.devices,
      selectedDevice: currentDevice ?? this.selectedDevice,
      dataPoints: dataPoints ?? this.dataPoints,
      chartViewMode: chartViewMode ?? this.chartViewMode,
    );
  }
}
