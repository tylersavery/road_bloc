import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:road_bloc/src/core/app/singletons.dart';
import 'package:road_bloc/src/core/app_router.gr.dart';
import 'package:road_bloc/src/feature/theme/theme_provider.dart';

GlobalKey<State<BottomNavigationBar>> bottomNavigationBar =
    GlobalKey<State<BottomNavigationBar>>();

GlobalKey<NavigatorState> navigatorKey = singleton<AppRouter>().navigatorKey;

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

// final appRouter = AppRouter();

class App extends ConsumerWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = singleton<AppRouter>();

    return MaterialApp.router(
      restorationScopeId: 'app',
      debugShowCheckedModeBanner: false,

      // navigatorKey: navigatorKey,
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
      ],
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ref.watch(themeProvider),
      routeInformationParser:
          appRouter.defaultRouteParser(includePrefixMatches: true),
      routerDelegate: AutoRouterDelegate(
        appRouter,
        // Provide an AutoRouteObserver instance
        navigatorObservers: () => [AutoRouteObserver()],
      ),
      // initialRoute: '/home',
    );
  }
}
