import 'package:blended_learning_system/routes/routes.dart';
import 'package:blended_learning_system/screens/assignment_screen.dart';
import 'package:blended_learning_system/services/user_service.dart';
import 'package:blended_learning_system/splash.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'lifecycle.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => UserService(),
      ),
    ],
    child: LifeCycle(
        child: MaterialApp(
          theme: ThemeData(fontFamily: 'Poppins'),
          home: AssignmentScreen(),
          debugShowCheckedModeBanner: false,
          initialRoute: RouteManager.splashPage,
          onGenerateRoute: RouteManager.generateRoute,
        )
    )
    );
  }
}
