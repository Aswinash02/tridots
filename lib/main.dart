// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tridots/controllers/home_controller.dart';
// import 'package:tridots/firebase_options.dart';
// import 'package:tridots/repository/firebase_repo.dart';
// import 'package:tridots/views/home_screen.dart';
//
// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // This will be called whenever a background notification is received
//   print("Background message received: ${message.data}");
//   // FirebaseRepo firebaseRepo = FirebaseRepo();
//   // firebaseRepo.handleMessage(message);
//
// }
//
// void main() async {
//
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   FirebaseRepo firebaseRepo = FirebaseRepo();
//   await firebaseRepo.initNotification();
//   FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
//   runApp(const MyMaterialApp());
// }
//
// class MyMaterialApp extends StatelessWidget {
//   const MyMaterialApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     Get.put(HomeController());
//     return const GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomeScreen(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> requestOverlayPermission() async {
  if (!await Permission.systemAlertWindow.isGranted) {
    await Permission.systemAlertWindow.request();
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await requestOverlayPermission();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Overlay Example")),
        body: Center(child: Text("Overlay Permission Example")),
      ),
    );
  }
}