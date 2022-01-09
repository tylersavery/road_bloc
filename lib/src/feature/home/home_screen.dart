import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:road_bloc/src/core/base_screen.dart';

class HomeScreen extends BaseScreen {
  const HomeScreen({Key? key})
      : super(
          key: key,
          includeMainDrawer: true,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Home"),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const Text("Welcome");
  }
}
