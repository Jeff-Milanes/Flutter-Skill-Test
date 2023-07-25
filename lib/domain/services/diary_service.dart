import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:xam_consulting_exam/data/contracts/diary_contract.dart';
import 'package:xam_consulting_exam/data/web/reqres_web_api.dart';
import 'package:xam_consulting_exam/domain/entity/diary_entity.dart';

abstract class IDiaryService {
  Future<void> upload(DiaryEntity entity);
}

@LazySingleton(as: IDiaryService)
class DiaryService implements IDiaryService {
  DiaryService(this._reqresWebApi);

  final ReqresWebApi _reqresWebApi;

  @override
  Future<void> upload(DiaryEntity entity) async {
    final contract = DiaryContract(
      photos: entity.photos.map((file) => base64Encode(file.readAsBytesSync())).toList(),
      comment: entity.comment,
      date: entity.date,
      area: entity.area,
      category: entity.category,
      tags: entity.tags,
      event: entity.event,
    );

    await _reqresWebApi.upload(contract);

    return;
  }
}
