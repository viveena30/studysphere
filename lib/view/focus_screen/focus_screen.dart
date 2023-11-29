import 'dart:async';

import 'package:mcwc/controller/profile_controller.dart';

import '../../const/const.dart';
import '../../widget_common/custom_elevated_button.dart';

class FocusScreen extends StatefulWidget {
  const FocusScreen({super.key});

  @override
  State<FocusScreen> createState() => _FocusScreenState();
}

class _FocusScreenState extends State<FocusScreen> {
  final ProfileController profileController = Get.find<ProfileController>();
  var duration = const Duration(seconds: maxSeconds);
  static const maxSeconds = 120;

  String twoDigits(int n) => n.toString().padLeft(2, '0');

  Timer? timer;

  void startTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }

    timer = Timer.periodic(const Duration(milliseconds: 50), (_) {
      var seconds = duration.inSeconds;
      if (seconds > 0) {
        setState(() {
          seconds--;
          duration = Duration(seconds: seconds);
        });
      } else {
        stopTimer(reset: false);
      }
    });
  }

  void stopTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }

    setState(() {
      timer!.cancel();
    });
  }

  void resetTimer() {
    setState(() {
      duration = const Duration(seconds: maxSeconds);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isRunning = (timer == null) ? false : timer!.isActive;
    final isCompleted =
        duration.inSeconds == 0 || duration.inSeconds == maxSeconds;

    final hours = twoDigits(duration.inHours.remainder(60));
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: lightGreyColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
        title: "Focus Mode"
            .text
            .color(whiteColor)
            .size(24)
            .fontFamily(bold)
            .make(),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Obx(
                  () => profileController.firstName.value.text
                      .color(darkFontGreyColor)
                      .fontFamily(bold)
                      .size(35)
                      .make()
                      .box
                      .margin(EdgeInsets.only(top: context.screenHeight * 0.05))
                      .make(),
                ),
                10.heightBox,
                " Let's focus together for"
                    .text
                    .color(fontGreyColor)
                    .fontFamily(bold)
                    .size(30)
                    .make()
                    .box
                    .make()
                    .onTap(() {
                  if (isRunning) {
                    null;
                  } else {
                    // set the max amount of timer here
                  }
                }),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 300,
                  height: 300,
                  child: Stack(
                    fit: StackFit.passthrough,
                    children: [
                      CircularProgressIndicator(
                        value: duration.inSeconds / maxSeconds,
                        strokeWidth: 12,
                        valueColor: const AlwaysStoppedAnimation(primaryColor),
                        backgroundColor: fontGreyColor.withOpacity(0.2),
                      ),
                      // "$seconds"
                      //     .text
                      //     .color(darkFontGreyColor)
                      //     .fontFamily(semiBold)
                      //     .size(context.screenHeight * 0.1)
                      //     .makeCentered()
                      duration.inSeconds == 0
                          ? const Icon(Icons.done,
                                  color: Colors.greenAccent, size: 112)
                              .box
                              .makeCentered()
                              .box
                              .color(whiteColor)
                              .width(context.screenWidth * 0.7)
                              .height(context.screenHeight * 0.35)
                              .outerShadowLg
                              .roundedFull
                              .make()
                          : Text(
                              "$hours:$minutes:$seconds",
                              style: TextStyle(
                                color: darkFontGreyColor,
                                fontFamily: semiBold,
                                fontSize: context.screenHeight * 0.08,
                              ),
                            )
                              .box
                              .makeCentered()
                              .box
                              .color(whiteColor)
                              .width(context.screenWidth * 0.7)
                              .height(context.screenHeight * 0.35)
                              .outerShadowLg
                              .roundedFull
                              .make(),
                    ],
                  ),
                ),
                20.heightBox,
                isRunning || !isCompleted
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            customElevatedButton(
                                    label: isRunning ? "Pause" : "Resume",
                                    onPress: () {
                                      isRunning
                                          ? stopTimer(reset: false)
                                          : startTimer(reset: false);
                                    },
                                    color: whiteColor,
                                    textColor: fontGreyColor,
                                    isUsedInRow: true,
                                    textSize: 24)
                                .box
                                .make(),
                            20.widthBox,
                            customElevatedButton(
                                    label: "Reset",
                                    onPress: () {
                                      stopTimer(reset: true);
                                    },
                                    color: primaryColor,
                                    textColor: whiteColor,
                                    isUsedInRow: true,
                                    textSize: 24)
                                .box
                                .make(),
                          ])
                    : customElevatedButton(
                            label: "Start focusing!",
                            onPress: () {
                              startTimer();
                            },
                            color: primaryColor,
                            textColor: whiteColor,
                            isUsedInRow: true,
                            textSize: 24)
                        .box
                        .make()
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: customElevatedButton(
              label: "End Focus Mode",
              onPress: () => Get.back(),
              color: const Color(0xFFD9D9D9),
              textColor: darkFontGreyColor,
              textSize: 24,
            )
                .box
                .margin(const EdgeInsets.only(left: 16, right: 16, bottom: 24))
                .make(),
          ),
        ],
      ),
    );
  }
}


                        // customElevatedButton(
            //   label: "End Focus Mode",
            //   onPress: () => Get.back(),
            //   color: const Color(0xFFD9D9D9),
            //   textColor: darkFontGreyColor,
            //   textSize: 24,
            // ).box.margin(const EdgeInsets.symmetric(horizontal: 16)).make(),