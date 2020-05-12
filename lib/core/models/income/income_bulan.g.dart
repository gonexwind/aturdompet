// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_bulan.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IncomeBulanAdapter extends TypeAdapter<IncomeBulan> {
  @override
  IncomeBulan read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IncomeBulan(
      fields[0] as String,
      fields[1] as int,
      fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, IncomeBulan obj) {
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
