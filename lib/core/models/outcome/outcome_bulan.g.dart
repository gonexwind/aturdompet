// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outcome_bulan.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OutcomeBulanAdapter extends TypeAdapter<OutcomeBulan> {
  @override
  OutcomeBulan read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OutcomeBulan(
      fields[0] as String,
      fields[1] as int,
      fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, OutcomeBulan obj) {
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
