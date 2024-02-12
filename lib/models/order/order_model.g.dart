// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      product: json['product'] as String,
      quantity: json['quantity'] as num,
      user: json['user'] as String,
      userPhone: json['userPhone'] as num,
      userEmail: json['userEmail'] as String,
      address: json['address'] as String,
      time: DateTime.parse(json['time'] as String),
      isCompleted: json['isCompleted'] as bool? ?? false,
      delay: json['delay'] as int?,
      lastLocalUpdate: json['lastLocalUpdate'] == null
          ? null
          : DateTime.parse(json['lastLocalUpdate'] as String),
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'product': instance.product,
      'quantity': instance.quantity,
      'user': instance.user,
      'userPhone': instance.userPhone,
      'userEmail': instance.userEmail,
      'address': instance.address,
      'time': instance.time.toIso8601String(),
      'isCompleted': instance.isCompleted,
      'delay': instance.delay,
      'lastLocalUpdate': instance.lastLocalUpdate?.toIso8601String(),
    };
