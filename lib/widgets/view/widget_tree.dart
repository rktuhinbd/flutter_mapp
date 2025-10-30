import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mapp/widgets/data/notifier.dart';
import 'package:flutter_mapp/widgets/view/screens/home_screen.dart';
import 'package:flutter_mapp/widgets/view/screens/profile_screen.dart';

import 'navbar_widget.dart';

List<Widget> screens = [HomeScreen(), ProfileScreen()];

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Go Flutter'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              isDarkModeSelectedNotifier.value =
                  !isDarkModeSelectedNotifier.value;
            },
            icon: ValueListenableBuilder(
              valueListenable: isDarkModeSelectedNotifier,
              builder: (context, value, child) {
                return value == true ? Icon(Icons.light_mode) : Icon(Icons.dark_mode);
              },
            ),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: screenUpdateNotifier,
        builder: (context, value, child) {
          return screens[value];
        },
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
