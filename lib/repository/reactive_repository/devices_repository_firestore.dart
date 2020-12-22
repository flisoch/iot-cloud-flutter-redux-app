import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/device.dart';
import 'package:flutter_app/repository/reactive_repository/devices_repository_reactive.dart';

class FirestoreReactiveDevicesRepository implements ReactiveDevicesRepository {
  static const String path = 'devices';

  final FirebaseFirestore firestore;

  const FirestoreReactiveDevicesRepository(this.firestore);

  @override
  Future<void> addNewDevice(Device device) {
    return firestore.collection(path).doc(device.id).set(device.toJson());
  }

  @override
  Future<void> deleteDevice(List<String> idList) async {
    await Future.wait<void>(idList.map((id) {
      return firestore.collection(path).doc(id).delete();
    }));
  }

  @override
  Future<List<Device>> devices() {
    var future = firestore.collection(path).get();
    future.then((value) =>
        value.docs.first.reference.get().then((value) => print(value.data())));
    return firestore.collection(path).get().then((collection) {
      return collection.docs
          .map((e) => Device.fromQueryDocumentSnapshot(e))
          .toList();
    });
  }

  @override
  Future<void> updateDevice(Device device) {
    return firestore.collection(path).doc(device.id).update(device.toJson());
  }

  @override
  Stream<List<Device>> streamDevices() {
    return firestore.collection(path).snapshots().map((devices) =>
        devices.docs.map((device) => Device.fromQueryDocumentSnapshot(device)));
  }
}
