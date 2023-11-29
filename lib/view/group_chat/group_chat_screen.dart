import 'package:mcwc/const/const.dart';

import '../../controller/chat_controller.dart';
import 'components/messages.dart';

class GroupChatScreen extends StatefulWidget {
  const GroupChatScreen({super.key});

  @override
  State<GroupChatScreen> createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  ChatController chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGreyColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: 'Chat'.text.color(whiteColor).size(32).fontFamily(bold).make(),
        centerTitle: true,
      ),
      body: Column(
        children: [
          10.heightBox,
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:
                      List.generate(chatController.messages.length, (index) {
                    return messageDialog(
                      fromMySide: chatController.messages[index].isMe,
                      message: chatController.messages[index].message,
                      maxWidthForDialog: context.screenWidth * 0.65,
                    );
                  }),
                ).box.margin(const EdgeInsets.symmetric(horizontal: 16)).make(),
              ),
            ),
          ),

          // chat sender
          Row(
            children: [
              Expanded(
                  child: TextField(
                controller: chatController.messageController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(16),
                  hintStyle: TextStyle(
                    fontFamily: semiBold,
                    color: fontGreyColor.withOpacity(0.5),
                  ),
                  hintText: "Type Your Message Here . . .",
                  isDense: true,
                  fillColor: whiteColor,
                  filled: true,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  // border: OutlineInputBorder(
                  //   borderSide: const BorderSide(
                  //       color: redColor, width: 1, style: BorderStyle.solid),
                  //   borderRadius: BorderRadius.circular(100),
                  // ),
                  // focusedBorder: const OutlineInputBorder(
                  //   borderSide: BorderSide(
                  //       color: redColor, width: 1, style: BorderStyle.solid),
                  //   borderRadius: BorderRadius.all(
                  //     Radius.circular(100),
                  //   ),
                  // ),
                ),
              )),
              10.widthBox,
              CircleAvatar(
                backgroundColor: primaryColor,
                foregroundColor: whiteColor,
                child: IconButton(
                    onPressed: () {
                      chatController.sendMessage();
                    },
                    icon: const Icon(
                      Icons.send,
                    )),
              )
            ],
          )
              .box
              .size(context.screenWidth, context.screenHeight * 0.08)
              .margin(const EdgeInsets.symmetric(horizontal: 16, vertical: 16))
              .padding(const EdgeInsets.symmetric(horizontal: 16, vertical: 8))
              .roundedLg
              .color(whiteColor)
              .outerShadow
              .make(),
        ],
      ),
    );
  }
}
