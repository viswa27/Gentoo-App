import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShippingRecord extends FirestoreRecord {
  ShippingRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  bool hasTime() => _time != null;

  void _initializeFields() {
    _category = snapshotData['category'] as String?;
    _time = snapshotData['time'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('shipping');

  static Stream<ShippingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ShippingRecord.fromSnapshot(s));

  static Future<ShippingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ShippingRecord.fromSnapshot(s));

  static ShippingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ShippingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ShippingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ShippingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ShippingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ShippingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createShippingRecordData({
  String? category,
  String? time,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'category': category,
      'time': time,
    }.withoutNulls,
  );

  return firestoreData;
}

class ShippingRecordDocumentEquality implements Equality<ShippingRecord> {
  const ShippingRecordDocumentEquality();

  @override
  bool equals(ShippingRecord? e1, ShippingRecord? e2) {
    return e1?.category == e2?.category && e1?.time == e2?.time;
  }

  @override
  int hash(ShippingRecord? e) =>
      const ListEquality().hash([e?.category, e?.time]);

  @override
  bool isValidKey(Object? o) => o is ShippingRecord;
}
