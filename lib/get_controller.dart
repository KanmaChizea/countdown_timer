import 'dart:async';

import 'package:countdown_timer/exceptions.dart';
import 'package:countdown_timer/notifications.dart';
import 'package:get/get.dart';

class TimerController extends GetxController {
  var title = ''.obs;
  var isStart = false.obs;
  var isPause = false.obs;
  var hour = 00.obs;
  var min = 00.obs;
  var sec = 00.obs;
  var inputtedTime = 0.obs;
  late Timer _timer;

  addTitle(String text) {
    title.value = text;
    update();
  }

  start(String t) {
    if (sec.value == 0 && min.value == 0 && hour.value == 0) {
      throw NoTimeSelected();
    } else {
      isStart.value = true;
      title.value = t;
      inputtedTime.value =
          (hour.value * 60 * 60) + (min.value * 60) + sec.value;
      play();
    }

    update();
  }

  stop() {
    isStart.value = false;
    title.value = '';
    _timer.cancel();

    hour.value = 0;
    min.value = 00;
    sec.value = 00;
    inputtedTime.value = 0;
  }

  pause() {
    isPause.value = true;
    _timer.cancel();
  }

  play() {
    isPause.value = false;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (sec.value == 0 && min.value != 0) {
        min.value--;
        sec.value = 60;
      }
      if (min.value == 0 && hour.value != 0 && sec.value == 0) {
        hour.value--;
        min.value = 59;
        sec.value = 60;
      }
      if (sec.value == 0 && min.value == 0 && hour.value == 0) {
        sendNotification();
        timer.cancel();

        isStart.value = false;
        return;
      }
      sec.value--;
    });
  }

  sendNotification() async {
    int h, m, s;

    h = inputtedTime.value ~/ 3600;

    m = ((inputtedTime.value - h * 3600)) ~/ 60;

    s = inputtedTime.value - (h * 3600) - (m * 60);

    String hourLeft =
        h.toString().length < 2 ? "0" + h.toString() : h.toString();

    String minuteLeft =
        m.toString().length < 2 ? "0" + m.toString() : m.toString();

    String secondsLeft =
        s.toString().length < 2 ? "0" + s.toString() : s.toString();

    String result = "$hourLeft:$minuteLeft:$secondsLeft";

    await createNotification(title.value, result);
  }
}
