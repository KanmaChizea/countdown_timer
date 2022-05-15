import 'package:countdown_timer/constants.dart';
import 'package:countdown_timer/get_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AfterStart extends StatelessWidget {
  const AfterStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TimerController timerController = Get.find<TimerController>();
    return Obx(
      () => Column(
        children: [
          const SizedBox(height: 30),
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 280,
                  width: 280,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    strokeWidth: 10,
                    value: ((timerController.hour.value * 60 * 60) +
                            (timerController.min.value * 60) +
                            timerController.sec.value) /
                        timerController.inputtedTime.value,
                    valueColor: const AlwaysStoppedAnimation(Color(0xffbc1919)),
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  height: 280,
                  width: 280,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${formatTimeToString(timerController.hour.value)}:${formatTimeToString(timerController.min.value)}:${formatTimeToString(timerController.sec.value)}',
                        style: const TextStyle(fontSize: 40),
                      ),
                      const SizedBox(height: 20),
                      if (timerController.title.value != '')
                        SizedBox(
                          width: 260,
                          height: 40,
                          child: FittedBox(
                              child: Column(
                            children: [
                              Text(
                                timerController.title.value,
                                style: const TextStyle(color: Colors.black),
                              ),
                            ],
                          )),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Flexible(flex: 5, child: Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(
                      title: 'Alert',
                      middleText: 'Are you sure you want to stop timer?',
                      actions: [
                        TextButton(
                            style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    side: const BorderSide(
                                        color: primaryColor, width: 1.0))),
                            onPressed: () {
                              timerController.stop();
                              Get.back();
                            },
                            child: const Text(
                              'Yes',
                              style: TextStyle(color: primaryColor),
                            )),
                        TextButton(
                            style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    side: const BorderSide(
                                        color: primaryColor, width: 1.0))),
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text(
                              'No',
                              style: TextStyle(color: primaryColor),
                            ))
                      ]);
                },
                child: const Icon(Icons.stop),
                style: styleButton,
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  timerController.isPause.value
                      ? timerController.play()
                      : timerController.pause();
                },
                child: timerController.isPause.value
                    ? const Icon(Icons.play_arrow)
                    : const Icon(Icons.pause),
                style: styleButton,
              ),
            ],
          ),
          Flexible(flex: 2, child: Container()),
        ],
      ),
    );
  }
}
