import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'test_dependency_injector.config.dart';

const testEnv = 'test';
final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'testInit',
  preferRelativeImports: true,
  generateForDir: ['test', 'lib', 'src'],
)
void configureTestDependencies() {
  getIt.testInit(environment: testEnv);
}
