import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:xam_consulting_exam/core/dependency_injection.config.dart';

@InjectableInit(
  initializerName: r'$register',
  preferRelativeImports: false,
  asExtension: false,
)
abstract class ServiceLocator {
  static final GetIt instance = GetIt.instance..allowReassignment = true;

  static void registerDependencies() {
    $register(instance);
  }
}
