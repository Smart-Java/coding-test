// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_txn_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeTxnModel _$HomeTxnModelFromJson(Map<String, dynamic> json) => HomeTxnModel(
      title: json['title'] as String,
      distribution: json['distribution'] as String,
      isItActive: json['isItActive'] as bool,
    );

Map<String, dynamic> _$HomeTxnModelToJson(HomeTxnModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'distribution': instance.distribution,
      'isItActive': instance.isItActive,
    };
