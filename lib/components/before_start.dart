import 'package:countdown_timer/constants.dart';
import 'package:countdown_timer/get_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BeforeStart extends StatelessWidget {
  const BeforeStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textcontroller = TextEditingController();
    TimerController timerController = Get.find<TimerController>();
    return Obx(
      () => Column(
        children: [
          Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
              child: TextField(
                  controller: textcontroller,
                  decoration: const InputDecoration(
                      hintText: 'Enter event name',
                      border: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 1.5, color: primaryColor))))),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  IconButton(
                      onPressed: () {
                        if (timerController.hour.value == 0) {
                          timerController.hour.value = 24;
                        } else {
                          timerController.hour.value--;
                        }
                      },
                      icon: const Icon(Icons.arrow_drop_up)),
                  Text(timerController.hour.value.toString(),
                      style: formatTime),
                  IconButton(
                      onPressed: () {
                        if (timerController.hour.value == 24) {
                          timerController.hour.value = 0;
                        } else {
                          timerController.hour.value++;
                        }
                      },
                      icon: const Icon(Icons.arrow_drop_down)),
                ],
              ),
              addColon,
              Column(
                children: [
                  IconButton(
                      onPressed: () {
                        if (timerController.min.value == 0) {
                          timerController.min.value = 59;
                        } else {
                          timerController.min.value--;
                        }
                      },
                      icon: const Icon(Icons.arrow_drop_up)),
                  Text(timerController.min.value.toString(), style: formatTime),
                  IconButton(
                      onPressed: () {
                        if (timerController.min.value == 59) {
                          timerController.min.value = 0;
                        } else {
                          timerController.min.value++;
                        }
                      },
                      icon: const Icon(Icons.arrow_drop_down)),
                ],
              ),
              addColon,
              Column(
                children: [
                  IconButton(
                      onPressed: () {
                        if (timerController.sec.value == 0) {
                          timerController.sec.value = 59;
                        } else {
                          timerController.sec.value--;
                        }
                      },
                      icon: const Icon(Icons.arrow_drop_up)),
                  Text(timerController.sec.value.toString(), style: formatTime),
                  IconButton(
                      onPressed: () {
                        if (timerController.sec.value == 59) {
                          timerController.sec.value = 0;
                        } else {
                          timerController.sec.value++;
                        }
                      },
                      icon: const Icon(Icons.arrow_drop_down)),
                ],
              )
            ],
          ),
          Flexible(flex: 5, child: Container()),
          ElevatedButton(
              clipBehavior: Clip.hardEdge,
              onPressed: () {
                try {
                  timerController.start(textcontroller.text);
                } catch (_) {
                  Get.snackbar('Alert', 'No time selected',
                      icon: const Icon(Icons.warning_rounded,
                          color: Color(0xffd0342c)),
                      snackPosition: SnackPosition.BOTTOM,
                      shouldIconPulse: false,
                      duration: const Duration(seconds: 2),
                      backgroundColor: primaryColor,
                      colorText: Colors.white,
                      margin: EdgeInsets.zero,
                      borderRadius: 0,
                      snackStyle: SnackStyle.GROUNDED);
                }
              },
              child: const Text('Start'),
              style: styleButton),
          Flexible(flex: 2, child: Container()),
        ],
      ),
    );
  }
}
