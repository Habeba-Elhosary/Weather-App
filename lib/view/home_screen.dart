import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'offline_home_screen.dart';
import 'online_home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            return const OnlineHomeScreen();
          } else {
            return const OfflineHomeScreen();
          }
        },
        child: Center(child:Image.asset('assets/images/loading.gif') ,),
      ),
    );
  }
}
