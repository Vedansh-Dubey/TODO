import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'screens/homepage.dart';
import 'package:cron/cron.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  AwesomeNotifications().initialize(null, // icon for your app notification
      [
        NotificationChannel(
            channelKey: 'key1',
            channelName: 'Dubeyji Todo',
            channelDescription: "Notification example",
            defaultColor: const Color(0XFF9050DD),
            ledColor: Colors.white,
            playSound: true,
            enableLights: true,
            enableVibration: true)
      ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    ScheduleTask1();
    ScheduleTask2();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TODO App',
      home: Home(),
    );
  }
}

final cron1 = Cron();
void ScheduleTask1() async {
  cron1.schedule(Schedule.parse("00 30 06 * * *"), () async {
    print("Executing task: ${DateTime.now()}");
    notify1();
  });
}

final cron2 = Cron();
void ScheduleTask2() async {
  cron2.schedule(Schedule.parse("00 15 21 * * *"), () async {
    print("Executing task: ${DateTime.now()}");
    notify2();
  });
}

void notify2() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 1,
      channelKey: 'key1',
      title:
          'Hey Buddy!! ${Emojis.smile_grinning_face}${Emojis.smile_grinning_face}',
      body:
          'Have a look if you are done for the day ${Emojis.smile_smiling_face_with_halo}',
    ),
  );
}

void notify1() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 2,
      channelKey: 'key1',
      title:
          'Holaaaa! Good Morning ${Emojis.smile_grinning_face}${Emojis.smile_grinning_face}',
      body:
          "Have a plan where to start the day from?? ${Emojis.smile_thinking_face}",
    ),
  );
}
