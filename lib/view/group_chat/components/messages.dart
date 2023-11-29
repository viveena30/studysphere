import 'package:mcwc/const/const.dart';
import 'package:mcwc/controller/profile_controller.dart';

messageDialog({maxWidthForDialog, message, fromMySide = true}) {
  return Row(
      // textBaseline: TextBaseline.alphabetic,
      // verticalDirection: VerticalDirection.down,
      mainAxisAlignment:
          fromMySide ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        !fromMySide
            ? Column(
                children: [
                  Image.asset(
                    profileBoy,
                    fit: BoxFit.cover,
                  )
                      .box
                      .size(40, 40)
                      .clip(Clip.antiAlias)
                      .roundedFull
                      .margin(const EdgeInsets.only(right: 10))
                      .make(),
                  5.heightBox,
                  "Manoj".text.size(10).make(),
                ],
              )
            : Container(),
        Container(
          constraints: BoxConstraints(
            maxWidth: maxWidthForDialog,
          ),
          child: Container(
            decoration: BoxDecoration(
                color: !fromMySide ? whiteColor : primaryColor,
                borderRadius: fromMySide
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      )
                    : const BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      )),
            child: "$message"
                .text
                .color(!fromMySide ? fontGreyColor : whiteColor)
                .size(16)
                .make()
                .box
                .margin(const EdgeInsets.symmetric(vertical: 8))
                .padding(const EdgeInsets.all(8))
                // .topRounded()
                .make()
                .box
                // .width(context.screenWidth * 0.65)
                .make(),
          ).box.margin(const EdgeInsets.symmetric(vertical: 8)).make(),
        ),
        fromMySide
            ? Column(
                children: [
                  Image.asset(
                    profileGirl,
                    fit: BoxFit.cover,
                  )
                      .box
                      .size(40, 40)
                      .clip(Clip.antiAlias)
                      .margin(const EdgeInsets.only(left: 10))
                      .roundedFull
                      .make(),
                  5.heightBox,
                  Obx(
                    () => Get.find<ProfileController>()
                        .firstName
                        .value
                        .text
                        .size(10)
                        .make(),
                  ),
                ],
              )
            : Container(),
      ]);
}
