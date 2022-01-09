import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:road_bloc/src/config/constants/breakpoints.dart';

abstract class BaseComponent extends ConsumerWidget {
  const BaseComponent({
    Key? key,
    this.isResponsive = false,
  }) : super(key: key);

  final bool isResponsive;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = MediaQuery.of(context).size.width <= BreakPoints.maxMobile;
    return !isResponsive || isMobile
        ? body(context, ref)
        : desktopBody(context, ref);
  }

  Widget body(BuildContext context, WidgetRef ref) {
    return Container();
  }

  Widget desktopBody(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
