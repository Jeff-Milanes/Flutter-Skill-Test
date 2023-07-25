import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:xam_consulting_exam/data/contracts/diary_contract.dart';

part 'reqres_web_api.g.dart';

@lazySingleton
@RestApi(baseUrl: 'https://reqres.in/api')
abstract interface class ReqresWebApi {
  @factoryMethod
  factory ReqresWebApi(Dio dio) = _ReqresWebApi;

  @POST('/users')
  Future<void> upload(@Body() DiaryContract contract);
}
