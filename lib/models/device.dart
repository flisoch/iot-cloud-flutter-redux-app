import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

class Device extends Object {
  String id;
  String name;
  DateTime timestamp;
  num temperature;

  Device({
    String id,
    String name,
    DateTime timestamp,
    num temperature,
  }) {
    this.id = id;
    this.name = name;
    this.temperature = temperature;
    this.timestamp = timestamp;
  }

  factory Device.dummy() => Device();

  factory Device.fromSnapshot(DataSnapshot snapshot) {
    return Device(
      id: snapshot.value['id'],
      name: snapshot.key,
      timestamp: snapshot.value['timestamp'],
      temperature: snapshot.value['temperature'],
    );
  }

  factory Device.fromQueryDocumentSnapshot(QueryDocumentSnapshot snapshot) {
    return Device(
      id: snapshot.data()['id'],
      name: snapshot.data()['name'],
      timestamp:
          DateTime.parse(snapshot.data()['timestamp'].toDate().toString()),
      temperature: snapshot.data()['temperature'],
    );
  }

  Map<String, Object> toJson() {
    return {
      'timestamp': timestamp,
      'temperature': temperature,
      'name': name,
      'id': id,
    };
  }

  static Device fromJson(Map<String, Object> json) {
    return Device(
      id: json['id'] as String,
      name: json['name'] as String,
      temperature: json['temperature'] as num,
      timestamp: DateTime.parse(json['complete'] as String),
    );
  }

  String formattedDate() {
    return "${DateFormat.yMd().format(this.timestamp)} ${DateFormat.jm().format(this.timestamp)}";
  }
}
