import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:blended_learning_system/routes/routes.dart';
import 'package:blended_learning_system/services/user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class InitApp {
  static final String apiKeyAndroid = '8C4A8C9D-E6EA-4D13-B912-41E6A02BB61A';
  static final String apiKeyiOS = 'C9749C47-015C-47C6-A8C9-8DBEFAF6F120';
  static final String appID = '91C7B8C7-7428-A32E-FF16-14A27C9C5400';

  static void initializeApp(BuildContext context) async {
    await Backendless.initApp(
        applicationId: appID,
        iosApiKey: apiKeyiOS,
        androidApiKey: apiKeyAndroid);
    String result = await context.read<UserService>().checkIfUserLoggedIn();
    if (result == 'OK') {
      Navigator.popAndPushNamed(context, RouteManager.homePage);
    } else {
      Navigator.popAndPushNamed(context, RouteManager.loginPage);
    }
  }
}
