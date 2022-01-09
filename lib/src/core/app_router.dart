import 'package:auto_route/auto_route.dart';
import 'package:road_bloc/src/feature/home/home_screen.dart';
import 'package:road_bloc/src/feature/settings/settings_screen.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route,Screen',
  routes: <AutoRoute>[
    AutoRoute(initial: true, path: '/', page: HomeScreen),
    AutoRoute(initial: true, path: '/settings', page: SettingsScreen),
    RedirectRoute(path: '*', redirectTo: '/'),
  ],
)
class $AppRouter {}
