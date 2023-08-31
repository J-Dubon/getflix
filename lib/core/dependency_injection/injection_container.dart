import 'package:get_it/get_it.dart';

import 'core_dependency_injection.dart';
import '../../features/movies/di/movies_dependency_injection.dart';

final getIt = GetIt.instance;

Future<void> injectDependencies() async {
  getIt.pushNewScope();

  await initCoreDependencies();
  await initMoviesDependencies();
}

void removeRegistrationIfExists<T extends Object>({String? instanceName}) {
  if (getIt.isRegistered<T>(instanceName: instanceName)) {
    getIt.unregister<T>(instanceName: instanceName);
  }
}
