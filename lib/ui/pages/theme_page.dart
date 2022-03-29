
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({
    Key? key,
  }) : super(key: key);

  @override
  _ThemePageState createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      duration: const Duration(milliseconds: 300),
      data: Theme.of(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Partograph'),
        ),
        body: SafeArea(
          child: SizedBox.expand(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                const Text(
                  'Current Theme Mode',
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 0.8,
                  ),
                ),
                Text(
                  AdaptiveTheme.of(context).mode.name.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 24,
                    height: 2.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () => AdaptiveTheme.of(context).toggleThemeMode(),
                  child: const Text('Toggle Theme Mode'),
                  style: ElevatedButton.styleFrom(
                    visualDensity:
                        const VisualDensity(horizontal: 4, vertical: 2),
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () => AdaptiveTheme.of(context).setDark(),
                  child: const Text('Set Dark'),
                  style: ElevatedButton.styleFrom(
                    visualDensity:
                        const VisualDensity(horizontal: 4, vertical: 2),
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () => AdaptiveTheme.of(context).setLight(),
                  child: const Text('set Light'),
                  style: ElevatedButton.styleFrom(
                    visualDensity:
                        const VisualDensity(horizontal: 4, vertical: 2),
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () => AdaptiveTheme.of(context).setSystem(),
                  child: const Text('Set System Default'),
                  style: ElevatedButton.styleFrom(
                    visualDensity:
                        const VisualDensity(horizontal: 4, vertical: 2),
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () => AdaptiveTheme.of(context).setTheme(
                    light: ThemeData(
                      brightness: Brightness.light,
                      primarySwatch: Colors.pink,
                    ),
                    dark: ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: Colors.pink,
                    ),
                  ),
                  child: const Text('Set Custom Theme'),
                  style: ElevatedButton.styleFrom(
                    visualDensity:
                        const VisualDensity(horizontal: 4, vertical: 2),
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () => AdaptiveTheme.of(context).reset(),
                  child: const Text('Reset to Default Themes'),
                  style: ElevatedButton.styleFrom(
                    visualDensity:
                        const VisualDensity(horizontal: 4, vertical: 2),
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
