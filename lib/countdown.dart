import 'package:countdown_timer/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:countdown_timer/get_controller.dart';

import 'components/after_start.dart';
import 'components/before_start.dart';
import 'notifications.dart';

class MyHomepage extends StatelessWidget {
  const MyHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    notificationPermission();
    final timerController = Get.put<TimerController>(TimerController());

    return Scaffold(
        backgroundColor: bgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            'Countdown Timer',
            style: TextStyle(color: shadowColor),
          ),
        ),
        body: Obx(() => timerController.isStart.value
            ? const AfterStart()
            : const BeforeStart()));
  }
}
