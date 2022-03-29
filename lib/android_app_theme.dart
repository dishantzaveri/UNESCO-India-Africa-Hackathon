import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:partograph/app.dart';

class AndroidAppTheme extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const AndroidAppTheme({Key? key, this.savedThemeMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            actionsIconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(color: Colors.white)),
        primaryTextTheme:
            const TextTheme(headline6: TextStyle(color: Colors.white)),
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.cyan, brightness: Brightness.light)
            .copyWith(secondary: Colors.cyan),
      ),
      dark: ThemeData(
        appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            actionsIconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(color: Colors.white)),
        primaryTextTheme:
            const TextTheme(headline6: TextStyle(color: Colors.white)),
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.cyan, brightness: Brightness.dark)
            .copyWith(secondary: Colors.cyan),
      ),
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => App(
        theme: theme,
        darkTheme: darkTheme,
      ),
    );
  }
}
