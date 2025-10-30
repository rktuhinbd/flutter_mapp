import 'package:flutter/material.dart';
import 'package:flutter_mapp/widgets/data/notifier.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: screenUpdateNotifier,
      builder: (context, screenIndex, child) {
        return NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
          ],
          onDestinationSelected: (int value) {
            screenUpdateNotifier.value = value;
            print(screenUpdateNotifier.value);
          },
          selectedIndex: screenIndex,
        );
      },
    );
  }
}
