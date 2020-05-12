// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outcome_hari.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OutcomeHariAdapter extends TypeAdapter<OutcomeHari> {
  @override
  OutcomeHari read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OutcomeHari(
      fields[0] as String,
      fields[1] as int,
      fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, OutcomeHari obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.desc)
      ..writeByte(1)
      ..write(obj.value)
      ..writeByte(2)
      ..write(obj.date);
  }
}
