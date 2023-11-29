import 'package:mcwc/controller/reminder_controller.dart';

import '../../const/const.dart';
import '../group_chat/group_chat_screen.dart';
import '../profile_screen/profile_screen.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

final DateTime today = DateTime.now();

class _ReminderScreenState extends State<ReminderScreen> {
  // Get today's date

  // Get the day of the week (0 - Sunday, 6 - Saturday)
  int dayOfWeek = today.weekday;

  // List of days of the week
  List<String> daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  final ReminderController reminderController = Get.put(ReminderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGreyColor,
      appBar: AppBar(
        title:
            "Reminders".text.color(whiteColor).size(32).fontFamily(bold).make(),
        actions: [
          IconButton(
            icon: const CircleAvatar(
                backgroundColor: whiteColor,
                foregroundColor: primaryColor,
                child: Icon(Icons.chat_rounded)),
            onPressed: () {
              Get.to(() => const GroupChatScreen());
            },
          ).box.margin(const EdgeInsets.only(right: 12)).make(),
          // IconButton(
          //   icon: const CircleAvatar(
          //       backgroundColor: whiteColor,
          //       foregroundColor: primaryColor,
          //       child: Icon(Icons.person)),
          //   onPressed: () {
          //     Get.to(() => const ProfileScreen());
          //   },
          // ).box.margin(const EdgeInsets.only(right: 16)).make(),
          Image.asset(profileGirl, height: 40, width: 40)
              .box
              .clip(Clip.antiAlias)
              .roundedFull
              .margin(
                const EdgeInsets.only(right: 16),
              )
              .make()
              .onTap(() {
            Get.to(() => const ProfileScreen());
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: secondaryColor,
          child: const Icon(Icons.add_rounded)),
      body: Column(children: [
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Row(
                  children: List.generate(7, (index) {
                    return dateTile(index: index);
                  }),
                ),
              ),
              10.widthBox,
              const Icon(Icons.arrow_forward_ios_rounded,
                      color: primaryColor, size: 32)
                  .box
                  .margin(const EdgeInsets.symmetric(horizontal: 8))
                  .make(),
              10.widthBox,
            ],
          ).box.margin(const EdgeInsets.symmetric(vertical: 20)).make(),
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Obx(
              () => Column(
                children: List.generate(reminderController.reminderList.length,
                    (index) => reminderTile(index: index)),
              ).box.margin(const EdgeInsets.symmetric(horizontal: 16)).make(),
            ),
          ),
        ),
      ]),
    );
  }

  Widget dateTile({required int index}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        daysOfWeek[(dayOfWeek + index) % 7]
            .text
            .size(16)
            .fontFamily(regular)
            .color(whiteColor)
            .make(),
        10.heightBox,
        (today.day + index)
            .toString()
            .text
            .size(24)
            .fontFamily(bold)
            .color(whiteColor)
            .make(),
      ],
    )
        .box
        .margin(const EdgeInsets.symmetric(horizontal: 8))
        .color(index == 0 ? secondaryColor : primaryColor)
        .padding(const EdgeInsets.symmetric(horizontal: 24, vertical: 16))
        .roundedSM
        .make();
  }

  Widget reminderTile({required int index}) {
    return Row(
      children: [
        reminderController.reminderList[index].time.text
            .size(20)
            .fontFamily(regular)
            .color(fontGreyColor)
            .make(),
        10.widthBox,
        reminderController.reminderList[index].title != ""
            ? reminderController.reminderList[index].title.text
                .size(16)
                .fontFamily(regular)
                .color(whiteColor)
                .make()
                .box
                .color(primaryColor)
                .outerShadow
                .padding(const EdgeInsets.all(16))
                .rounded
                .make()
            : const SizedBox(),
        10.widthBox,
        const Expanded(child: Divider(color: fontGreyColor, thickness: 1)),
      ],
    ).box.margin(const EdgeInsets.only(bottom: 8)).height(50).make();
  }
}
