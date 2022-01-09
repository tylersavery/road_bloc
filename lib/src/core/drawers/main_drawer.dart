import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:road_bloc/src/core/app_router.gr.dart';
import 'package:road_bloc/src/core/base_component.dart';

class MainDrawer extends BaseComponent {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: const Text("Home"),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).pop();
                AutoRouter.of(context).replace(const HomeScreenRoute());
              },
            ),
            ListTile(
              title: const Text("Settings"),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).pop();
                AutoRouter.of(context).replace(const SettingsScreenRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}
