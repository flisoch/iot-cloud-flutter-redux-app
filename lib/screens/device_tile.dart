import 'package:flutter/material.dart';
import 'package:flutter_app/models/device.dart';

class DeviceTile extends StatelessWidget {
  DeviceTile(this.device, {this.expanded, this.onTap, this.onHistoryDataTap});

  final Device device;
  final GestureTapCallback onTap;
  final GestureTapCallback onHistoryDataTap;
  final bool expanded;

  Widget _buildHeader() {

    return new ListTile(
      key: new ValueKey(device.name),
      title: new Text("${device.name}",
          style: TextStyle(fontWeight: FontWeight.w500)),
      subtitle: new Text("Last sync: ${device.formattedDate()}"),
      leading: const Icon(Icons.developer_board, size: 36.0),
      trailing: new Icon(
          this.expanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
          size: 36.0),
      onTap: this.onTap,
    );
  }

  Widget _buildCard(Widget child, {Function() onTap}) {
    return Material(
        elevation: 4.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Colors.black,
        child: InkWell(child: child));
  }

  Widget _buildDataCard(
      String metricName, num value, String metric, IconData icon) {
    return Container(
      margin: EdgeInsets.all(2.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(metricName, style: TextStyle(color: Colors.green)),
                Text(
                  "$value $metric",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 34.0,
                  ),
                )
              ],
            ),
            Material(
                color: Colors.green,
                borderRadius: BorderRadius.circular(24.0),
                child: Center(
                    child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(icon, color: Colors.white, size: 30.0),
                )))
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    var children = <Widget>[
      _buildHeader(),
    ];
    if (expanded) {
      children.addAll([
        // _buildDataCard('Methane', device.methane, 'ppm', Icons.wb_iridescent),
        // _buildDataCard(
        //     'Air Quality', device.airQuality, 'ppm', Icons.wb_iridescent),
        // _buildDataCard('Humidity', device.humidity, '%', Icons.wb_cloudy),
        _buildDataCard('Temperature', device.temperature, 'Cº', Icons.thermostat_rounded),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(4.0),
          child: FlatButton.icon(
            icon: const Icon(Icons.calendar_today_outlined),
            color: Colors.green,
            textColor: Colors.white,
            label: const Text('See historical data'),
            onPressed: this.onHistoryDataTap,
          ),
        ),
      ]);
    }
    return Container(
      margin: EdgeInsets.all(4.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _buildCard(
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children),
        ),
      ),
    );
  }
}
