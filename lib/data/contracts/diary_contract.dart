import 'package:json_annotation/json_annotation.dart';

part 'diary_contract.g.dart';

@JsonSerializable()
class DiaryContract {
  List<String>? photos;
  String? comment;
  String? date;
  String? area;
  String? category;
  String? tags;
  String? event;

  DiaryContract({
    this.photos,
    this.comment,
    this.date,
    this.area,
    this.category,
    this.tags,
    this.event,
  });

  factory DiaryContract.fromJson(Map<String, dynamic> json) => _$DiaryContractFromJson(json);
  Map<String, dynamic> toJson() => _$DiaryContractToJson(this);
}
