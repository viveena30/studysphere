import 'package:mcwc/const/const.dart';
import 'package:flutter/services.dart';

import 'custom_elevated_button.dart';

Widget exitDialogue(context) {
  return Dialog(
    backgroundColor: lightGreyColor,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        "Confirm Exit"
            .text
            .fontFamily(bold)
            .size(24)
            .color(darkFontGreyColor)
            .make(),
        10.heightBox,
        const Divider(),
        "Are you sure you want to exit?"
            .text
            .size(16)
            .color(darkFontGreyColor)
            .make(),
        30.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            customElevatedButton(
              label: "No",
              onPress: () => Get.back(),
              color: primaryColor,
              isUsedInRow: true,
              textColor: whiteColor,
            ),
            customElevatedButton(
              label: "Yes",
              onPress: () {
                SystemNavigator.pop();
              },
              color: whiteColor,
              isUsedInRow: true,
              textColor: darkFontGreyColor,
            ),
          ],
        ),
      ],
    ).box.padding(const EdgeInsets.all(16)).make(),
  );
}
