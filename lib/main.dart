import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// auto refresh
import 'package:auto_reload/auto_reload.dart';

// import 'package:usocial/layouts/mobile_screen_layout.dart';
// import 'package:usocial/layouts/responsive_layout.dart';
// import 'package:usocial/layouts/web_screen_layout.dart';
import 'package:usocial/screens/login.dart';
import 'package:usocial/utils/colors.dart';
import 'package:usocial/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      // home: const ResponsiveLayout(
      //     webScreenLayout: WebScreenLayout(),
      //     mobileScreenLayout: MobileScreenLayout()),
      home: const Login(),
    );
  }
}
