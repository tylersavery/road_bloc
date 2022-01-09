import 'package:road_bloc/src/core/app_router.gr.dart';
import 'package:get_it/get_it.dart';
import 'package:road_bloc/src/core/app/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

final singleton = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  singleton.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  singleton.registerSingleton<AppRouter>(AppRouter());

  singleton.registerLazySingleton<Storage>(
    () => StorageImplementation(),
  );
}
