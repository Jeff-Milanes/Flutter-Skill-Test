// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:xam_consulting_exam/core/platform/platform_module.dart' as _i7;
import 'package:xam_consulting_exam/data/web/reqres_web_api.dart' as _i4;
import 'package:xam_consulting_exam/domain/services/diary_service.dart' as _i5;
import 'package:xam_consulting_exam/presentation/bloc/diary_bloc.dart' as _i6;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $register(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.Dio>(registerModule.dio());
  gh.lazySingleton<_i4.ReqresWebApi>(() => _i4.ReqresWebApi(gh<_i3.Dio>()));
  gh.lazySingleton<_i5.IDiaryService>(
      () => _i5.DiaryService(gh<_i4.ReqresWebApi>()));
  gh.factory<_i6.DiaryBloc>(() => _i6.DiaryBloc(gh<_i5.IDiaryService>()));
  return getIt;
}

class _$RegisterModule extends _i7.RegisterModule {}
