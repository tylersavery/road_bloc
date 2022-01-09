// ignore_for_file: constant_identifier_names, library_prefixes

import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:road_bloc/gen/assets.gen.dart';

enum _Environment {
  Develop,
  Production,
}
const _env = _Environment.Develop;

class Env {
  static init() async {
    String? envPath;
    switch (_env) {
      case _Environment.Develop:
        envPath = Assets.env.devEnv;
        break;
      case _Environment.Production:
        envPath = Assets.env.prodEnv;
        break;
    }

    await DotEnv.dotenv.load(fileName: envPath);
  }

  static String get envName {
    return DotEnv.dotenv.env['ENVIRONMENT_NAME'] ?? 'unset';
  }

  static String get storagePrefix {
    return DotEnv.dotenv.env['STORAGE_PREFIX'] ?? 'unset';
  }
}
