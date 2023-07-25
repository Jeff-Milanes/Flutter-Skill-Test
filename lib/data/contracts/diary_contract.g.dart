// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_contract.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiaryContract _$DiaryContractFromJson(Map<String, dynamic> json) =>
    DiaryContract(
      photos:
          (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList(),
      comment: json['comment'] as String?,
      date: json['date'] as String?,
      area: json['area'] as String?,
      category: json['category'] as String?,
      tags: json['tags'] as String?,
      event: json['event'] as String?,
    );

Map<String, dynamic> _$DiaryContractToJson(DiaryContract instance) =>
    <String, dynamic>{
      'photos': instance.photos,
      'comment': instance.comment,
      'date': instance.date,
      'area': instance.area,
      'category': instance.category,
      'tags': instance.tags,
      'event': instance.event,
    };
