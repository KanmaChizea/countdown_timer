import 'package:countdown_timer/constants.dart';
import 'package:countdown_timer/get_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BeforeStart extends StatelessWidget {
  const BeforeStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textcontroller = TextEditingController();
    List<int> secondList = List.generate(60, (int index) => index);
    List<int> minuteList = List.generate(60, (int index) => index);
    List<int> hourList = List.generate(25, (int index) => index);

    TimerController timerController = Get.find<TimerController>();

    return Column(
      children: [
        Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
            child: TextField(
                controller: textcontroller,
                decoration: const InputDecoration(
                    hintText: 'Enter event name',
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.5, color: primaryColor))))),
        Flexible(
          child: Container(),
        ),
        SizedBox(
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: BuildTimeComponent(
                  list: hourList,
                  onSelectedItemChanged: (val) =>
                      timerController.hour.value = hourList[val],
                ),
              ),
              addColon,
              Expanded(
                child: BuildTimeComponent(
                  list: minuteList,
                  onSelectedItemChanged: (val) =>
                      timerController.min.value = minuteList[val],
                ),
              ),
              addColon,
              Expanded(
                child: BuildTimeComponent(
                  list: secondList,
                  onSelectedItemChanged: (val) =>
                      timerController.sec.value = secondList[val],
                ),
              ),
            ],
          ),
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
    );
    /*   return Obx(
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
    );*/
  }
}

class BuildTimeComponent extends StatefulWidget {
  const BuildTimeComponent({
    Key? key,
    required this.list,
    required this.onSelectedItemChanged,
  }) : super(key: key);

  final List<int> list;
  final void Function(int) onSelectedItemChanged;

  @override
  State<BuildTimeComponent> createState() => _BuildTimeComponentState();
}

class _BuildTimeComponentState extends State<BuildTimeComponent> {
  int isSelected = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView.useDelegate(
        physics: const FixedExtentScrollPhysics(),
        diameterRatio: 2,
        squeeze: 0.8,
        onSelectedItemChanged: (e) {
          widget.onSelectedItemChanged(e);
          setState(() {
            isSelected = e;
          });
        },
        itemExtent: 50.0,
        childDelegate: ListWheelChildLoopingListDelegate(children: [
          ...widget.list.map(
            (e) => Text(
                e.toString().length == 1 ? '0${e.toString()}' : e.toString(),
                style: TextStyle(
                  fontSize: 40,
                  color: isSelected == e ? shadowColor : primaryColor,
                )),
          ),
        ]));
  }
}
