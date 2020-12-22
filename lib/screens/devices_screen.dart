import 'package:flutter/material.dart';
import 'package:flutter_app/screens//device_tile.dart';
import 'package:flutter_app/store_connectors//on_loading_builder.dart';
import 'package:flutter_app/models/device.dart';
import 'package:flutter_app/screens//loading_indicator.dart';
import 'package:flutter_app/routes.dart';

class DevicesScreen extends StatelessWidget {
  final List<Device> devices;
  final bool isLoading;
  final Function refreshScreen;
  final Function selectDevice;
  final Device selectedDevice;

  DevicesScreen({
    Key key,
    @required this.devices,
    @required this.isLoading,
    @required this.refreshScreen,
    @required this.selectDevice,
    @required this.selectedDevice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Home Sensors'),
      ),
      // body:  devices?? DeviceTileList(devices) ,
      body: OnLoadingBuilder(
        builder: (context, isLoading) {
          return isLoading
              ? LoadingIndicator()
              : _buildListView(devices, selectedDevice);
        },
      ),
      floatingActionButton: FloatingActionButton(
        key: Key('__addDevice__'),
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.deviceChart);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildListView(List<Device> devices, Device selectedDevice) {
    return RefreshIndicator(
        onRefresh: refreshScreen,
        child: ListView.builder(
          itemCount: devices.length,
          itemBuilder: (BuildContext context, int index) {
            Device device = devices[index];
            bool expanded = device == selectedDevice;
            return DeviceTile(
              device,
              expanded: expanded,
              // onHistoryDataTap: () {
              //   onHistoryDataTap(device);
              // },
              onTap: () => expanded
                  ? selectDevice(Device.dummy())
                  : selectDevice(device),
              onHistoryDataTap: () => Navigator.pushNamed(context, AppRoutes.deviceChart),
            );
          },
        ));
  }
}
