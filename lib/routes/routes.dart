import 'package:blended_learning_system/screens/assignment_screen.dart';
import 'package:blended_learning_system/screens/dashboard.dart';
import 'package:blended_learning_system/screens/date_sheet.dart';
import 'package:blended_learning_system/screens/fee_screen.dart';
import 'package:blended_learning_system/screens/login_page.dart';
import 'package:blended_learning_system/screens/profile.dart';
import 'package:blended_learning_system/screens/result_screen.dart';
import 'package:blended_learning_system/screens/results.dart';
import 'package:blended_learning_system/screens/welcome_screen.dart';
import 'package:blended_learning_system/splash.dart';
import 'package:flutter/material.dart';
import '../screens/loading.dart';
import '../screens/register_page.dart';
import '../screens/settings_page.dart';

class RouteManager {
  static const String loginPage = '/';
  static const String registerPage = '/registerPage';
  static const String homePage = '/todoPage';
  static const String splashPage = '/splashPage';
  static const String assignmentPage = '/assignmentPage';
  static const String welcomePage = '/welcomePage';
  static const String myProfilePage = '/myProfilePage';
  static const String feesPage = '/feesPage';
  static const String datePage = '/datePage';
  static const String resultScreen = '/resultScreen';
  static const String settingsPage = '/settingsPage';
   static const String dashboard = '/dashboard';
  



  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcomePage:
        return MaterialPageRoute(
          builder: (context) => WelcomePage(),
        );

      case loginPage:
        return MaterialPageRoute(
          builder: (context) => SignIn(),
        );

        case dashboard:
        return MaterialPageRoute(
          builder: (context) => Dashboard(),
        );

      case registerPage:
        return MaterialPageRoute(
          builder: (context) => Register(),
        );

      case assignmentPage:
        return MaterialPageRoute(
          builder: (context) => AssignmentScreen(),
        );

      case myProfilePage:
        return MaterialPageRoute(
          builder: (context) => MyProfileScreen(),
        );

      case feesPage:
        return MaterialPageRoute(
          builder: (context) => FeeScreen(),
        );

      case datePage:
        return MaterialPageRoute(
          builder: (context) => DateSheetScreen(),
        );

      case splashPage:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
        );

        case resultScreen:
        return MaterialPageRoute(
          builder: (context) => ResultScreen(),
        );

        case settingsPage:
        return MaterialPageRoute(
          builder: (context) => SettingsPage(),
        );


      default:
        throw FormatException('Route not found! Check routes again!');
    }
  }
}
