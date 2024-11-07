import 'package:flutter/material.dart';
import 'package:tridots/common/custom_text.dart';

class NotificationScreen extends StatelessWidget {
  final String title;
  final String message;

  const NotificationScreen(
      {super.key, required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(text: "Title : ${title}"),
            CustomText(text: "Message : ${message}")
          ],
        ),
      ),
    );
  }
}
