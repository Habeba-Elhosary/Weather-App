import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../controller/global_controller.dart';
import '../view/offline_screen/offline_screen.dart';

class OfflineWrapper extends GetView<GlobalController> {
  final Widget child;
  const OfflineWrapper({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return child;
          } else {
            return const OfflineScreen();
          }
        },
        child:child
      ),
    );
  }
}
