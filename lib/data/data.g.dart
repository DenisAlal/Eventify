// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MediaEntityAdapter extends TypeAdapter<MediaEntity> {
  @override
  final int typeId = 1;

  @override
  MediaEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MediaEntity(
      fields[0] as int,
      fields[1] as String,
      fields[2] as String,
      fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, MediaEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.originUrl)
      ..writeByte(2)
      ..write(obj.previewUrl)
      ..writeByte(3)
      ..write(obj.creatorId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MediaEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserEntityAdapter extends TypeAdapter<UserEntity> {
  @override
  final int typeId = 0;

  @override
  UserEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserEntity(
      id: fields[0] as int,
      name: fields[1] as String?,
      surname: fields[2] as String?,
      aboutMe: fields[3] as String?,
      email: fields[4] as String?,
      phone: fields[5] as String?,
      emailVerifiedAt: fields[6] as String?,
      lat: fields[7] as double?,
      long: fields[8] as double?,
      avatar: fields[9] as MediaEntity?,
    );
  }

  @override
  void write(BinaryWriter writer, UserEntity obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.surname)
      ..writeByte(3)
      ..write(obj.aboutMe)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.phone)
      ..writeByte(6)
      ..write(obj.emailVerifiedAt)
      ..writeByte(7)
      ..write(obj.lat)
      ..writeByte(8)
      ..write(obj.long)
      ..writeByte(9)
      ..write(obj.avatar);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorDto _$ErrorDtoFromJson(Map<String, dynamic> json) => ErrorDto(
      message: json['message'] as String,
      fileName: json['fileName'] as String,
    );

Map<String, dynamic> _$ErrorDtoToJson(ErrorDto instance) => <String, dynamic>{
      'message': instance.message,
      'fileName': instance.fileName,
    };

ErrorsDto _$ErrorsDtoFromJson(Map<String, dynamic> json) => ErrorsDto(
      errors: (json['errors'] as List<dynamic>)
          .map((e) => ErrorDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ErrorsDtoToJson(ErrorsDto instance) => <String, dynamic>{
      'errors': instance.errors,
    };

ConfigDto _$ConfigDtoFromJson(Map<String, dynamic> json) => ConfigDto(
      broadcaster: json['broadcaster'] as String,
      key: json['key'] as String,
      cluster: json['cluster'] as String,
      encrypted: json['encrypted'] as bool,
      wsHost: json['wsHost'] as String,
      wsPort: json['wsPort'] as String,
      wssPort: json['wssPort'] as String,
      forceTLS: json['forceTLS'] as bool,
      disableStats: json['disableStats'] as bool,
      enabledTransports: (json['enabledTransports'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ConfigDtoToJson(ConfigDto instance) => <String, dynamic>{
      'broadcaster': instance.broadcaster,
      'key': instance.key,
      'cluster': instance.cluster,
      'encrypted': instance.encrypted,
      'wsHost': instance.wsHost,
      'wsPort': instance.wsPort,
      'wssPort': instance.wssPort,
      'forceTLS': instance.forceTLS,
      'disableStats': instance.disableStats,
      'enabledTransports': instance.enabledTransports,
    };
