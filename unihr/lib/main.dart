import 'dart:ffi';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'core/feature/splash/splash_page.dart';
import 'injection_container.dart' as di;
import 'injection.dart';

void main() async{
  // AwesomeNotifications().initialize(
  //     null,
  //     [
  //       NotificationChannel(
  //           channelKey: "basic_channel",
  //           channelName: "Basic Notification",
  //           channelDescription: "Notificaation channel",
  //       ),
  //     ],
  //   debug: true,
  // );
  WidgetsFlutterBinding.ensureInitialized();
  Intl.defaultLocale = 'th';
  await initializeDateFormatting();
  await di.init();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) => runApp(const Injection(router: MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'daily_notification',
          channelName: 'Daily Notifications',
          channelDescription: 'Shows daily notifications',
          defaultColor: Color(0xFF9D50DD),
          ledColor: Colors.white,
        ),
      ],
    );

    // Schedule a daily notification
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 0,
        channelKey: 'daily_notification',
        title: 'คำถามรายวัน',
        body: 'มาทำคำถามรายวันเพื่อรับเหรียญกัน!',

      ),
      schedule: NotificationCalendar(
        second: 0,
        hour: 8, // Adjust the time here (e.g., 8 AM)
        minute: 0,
        repeats: true,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'UniHR',
      theme: ThemeData(
        dialogTheme: const DialogTheme(
            backgroundColor: Colors.white
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        tabBarTheme: const TabBarTheme(
            dividerColor: Colors.transparent
        ),
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashPage(),
    );
  }
}
