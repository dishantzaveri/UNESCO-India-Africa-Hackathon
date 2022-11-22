import 'package:flutter/material.dart';
import 'package:mother_and_baby/provider/auth_provider.dart';
import 'package:mother_and_baby/provider/date_schedule_provider.dart';
import 'package:mother_and_baby/provider/heart_rate_provider.dart';
import 'package:mother_and_baby/provider/mother_provider.dart';
import 'package:mother_and_baby/provider/utility_provider.dart';
import 'package:mother_and_baby/routes/routes.dart';
import 'package:mother_and_baby/ui/pages/auth/login_page.dart';
import 'package:mother_and_baby/ui/pages/home/home_page.dart';
import 'package:mother_and_baby/ui/pages/loader_screen.dart';
import 'package:mother_and_baby/ui/pages/onboarding_page.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MotherProvider()..loadMothers()),
        ChangeNotifierProvider(create: (_) => UtilityProvider()),
        ChangeNotifierProvider(create: (_) => HeartRateProvider()),
        ChangeNotifierProvider(create: (_) => DateScheduleProvider()),
      ],
      child: MaterialApp(
          title: 'Partograph',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.pink),
          home: const AnimatedLoaderScreen(),
          routes: {
            homePageRouteAndroid: (context) => const HomePage(),
            loginPageRouteAndroid: (context) => LoginPage(),
            onboardingPageRoute: (context) => const OnBoardingPage()
          }),
    );
  }
}
