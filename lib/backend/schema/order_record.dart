import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderRecord extends FirestoreRecord {
  OrderRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "tracking" field.
  DocumentReference? _tracking;
  DocumentReference? get tracking => _tracking;
  bool hasTracking() => _tracking != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "ordertime" field.
  DateTime? _ordertime;
  DateTime? get ordertime => _ordertime;
  bool hasOrdertime() => _ordertime != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _tracking = snapshotData['tracking'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _ordertime = snapshotData['ordertime'] as DateTime?;
    _location = snapshotData['location'] as LatLng?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('order')
          : FirebaseFirestore.instance.collectionGroup('order');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('order').doc(id);

  static Stream<OrderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrderRecord.fromSnapshot(s));

  static Future<OrderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrderRecord.fromSnapshot(s));

  static OrderRecord fromSnapshot(DocumentSnapshot snapshot) => OrderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrderRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrderRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrderRecordData({
  DocumentReference? tracking,
  String? status,
  DateTime? ordertime,
  LatLng? location,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tracking': tracking,
      'status': status,
      'ordertime': ordertime,
      'location': location,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrderRecordDocumentEquality implements Equality<OrderRecord> {
  const OrderRecordDocumentEquality();

  @override
  bool equals(OrderRecord? e1, OrderRecord? e2) {
    return e1?.tracking == e2?.tracking &&
        e1?.status == e2?.status &&
        e1?.ordertime == e2?.ordertime &&
        e1?.location == e2?.location;
  }

  @override
  int hash(OrderRecord? e) => const ListEquality()
      .hash([e?.tracking, e?.status, e?.ordertime, e?.location]);

  @override
  bool isValidKey(Object? o) => o is OrderRecord;
}
