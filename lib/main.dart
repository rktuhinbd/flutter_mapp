import 'package:flutter/material.dart';
import 'package:flutter_mapp/widgets/data/notifier.dart';
import 'package:flutter_mapp/widgets/view/widget_tree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeSelectedNotifier,
      builder: (context, isDarkModeSelected, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.teal,
              brightness: isDarkModeSelected ? Brightness.dark : Brightness.light,
            ),
          ),
          home: WidgetTree(),
        );
      },
    );
  }
}
