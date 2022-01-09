import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:road_bloc/src/feature/theme/theme_provider.dart';
import 'package:road_bloc/src/core/base_screen.dart';

class SettingsScreen extends BaseScreen {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Settings"),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Theme:"),
        DropdownButton<ThemeMode>(
          value: ref.watch(themeProvider),
          onChanged: (value) {
            switch (value) {
              case ThemeMode.dark:
                ref.read(themeProvider.notifier).setDark();
                break;
              case ThemeMode.light:
                ref.read(themeProvider.notifier).setLight();
                break;
              case ThemeMode.system:
                ref.read(themeProvider.notifier).setSystem();
                break;
              default:
                break;
            }
          },
          items: const [
            DropdownMenuItem(
              value: ThemeMode.system,
              child: Text('System Theme'),
            ),
            DropdownMenuItem(
              value: ThemeMode.light,
              child: Text('Light Theme'),
            ),
            DropdownMenuItem(
              value: ThemeMode.dark,
              child: Text('Dark Theme'),
            )
          ],
        ),
      ],
    );
  }
}
