import 'package:mcwc/controller/todo_controller.dart';
import 'package:mcwc/view/group_chat/group_chat_screen.dart';
import 'package:mcwc/view/profile_screen/profile_screen.dart';

import '../../const/const.dart';
import '../../controller/profile_controller.dart';
import '../../controller/reminder_controller.dart';
import '../../widget_common/focus_elevated_button.dart';
import '../focus_screen/focus_screen.dart';
import 'components/reminder_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TodoController todoController = Get.put(TodoController());
  final ProfileController profileController = Get.find<ProfileController>();
  final ReminderController reminderController = Get.find<ReminderController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Home".text.color(whiteColor).size(32).fontFamily(bold).make(),
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => Align(
                alignment: Alignment.center,
                child: RichText(
                    text: TextSpan(
                  children: <TextSpan>[
                    const TextSpan(
                        text: "Good Afternoon, ",
                        style: TextStyle(
                            color: fontGreyColor,
                            fontSize: 20,
                            fontFamily: semiBold)),
                    TextSpan(
                        text: profileController.firstName.value,
                        style: const TextStyle(
                            color: darkFontGreyColor,
                            fontSize: 24,
                            fontFamily: bold)),
                  ],
                )),
              ),
            ),
            20.heightBox,
            focusElevatedButton(
              label: 'Enter Focus Mode',
              onPress: () {
                Get.to(() => const FocusScreen());
              },
              gradient: const LinearGradient(
                colors: [secondaryColor, Colors.lightBlueAccent, primaryColor],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              textColor: whiteColor,
              textSize: 24,
            ).box.shadow.make(),
            // customElevatedButton(
            //         label: enterFocusMode,
            //         onPress: () {
            //           Get.to(() => const FocusScreen());
            //         },
            //         color: const Color(0xFFD9D9D9),
            //         textColor: Colors.black,
            //         textSize: 24)
            //     .box
            //     .outerShadowLg
            //     .make(),
            10.heightBox,
            const Divider(),
            10.heightBox,
            upComingReminders.text
                .fontFamily(bold)
                .color(darkFontGreyColor)
                .size(20)
                .make(),
            10.heightBox,
            Obx(
              () => Column(
                  children: List.generate(
                      reminderController.reminderList.length, (index) {
                if (reminderController.reminderList[index].title != "") {
                  return reminderTile(
                    title: reminderController.reminderList[index].title,
                    time: reminderController.reminderList[index].time,
                  );
                } else {
                  return const SizedBox();
                }
              })),
            ),
            10.heightBox,
            const Divider(),
            10.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                tasks.text
                    .fontFamily(bold)
                    .color(darkFontGreyColor)
                    .size(20)
                    .make(),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () async {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              title: const Text("Add Task"),
                              content: TextField(
                                controller:
                                    todoController.textEditingController,
                                decoration: const InputDecoration(
                                    hintText: "Enter Task"),
                              ),
                              actions: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: primaryColor,
                                      padding: const EdgeInsets.all(8),
                                      elevation: 0),
                                  onPressed: () {
                                    if (todoController.textEditingController
                                        .text.isNotEmpty) {
                                      todoController.addTodo(
                                          title: todoController
                                              .textEditingController.text);
                                      todoController.textEditingController
                                          .clear();
                                      Get.back();
                                    }
                                  },
                                  child: const Text("Add"),
                                ),
                              ],
                            ));
                  },
                ),
              ],
            ),
            Obx(
              () => Column(
                children: List.generate(todoController.todos.length, (index) {
                  // return tasksTile(
                  // title: todoController.todos[index].title,
                  // index: index,
                  // );
                  return ListTile(
                    title: todoController.todos[index].isDone
                        ? todoController.todos[index].title.text.lineThrough
                            .fontFamily(semiBold)
                            .color(fontGreyColor)
                            .make()
                        : todoController.todos[index].title.text
                            .fontFamily(semiBold)
                            .color(fontGreyColor)
                            .make(),
                    leading: Checkbox(
                      value: todoController.todos[index].isDone,
                      onChanged: (newValue) async {
                        setState(() {
                          todoController.todos[index].isDone = newValue!;
                        });
                        await Future.delayed(
                            const Duration(milliseconds: 1000));
                        todoController.removeTodo(index: index);
                        // todoController.todos[index].isDone = newValue!;
                      },
                    ),
                    tileColor: lightGreyColor,
                  )
                      .box
                      .margin(const EdgeInsets.symmetric(vertical: 4))
                      .rounded
                      .make();
                }),
              ),
            )
          ],
        ).box.margin(const EdgeInsets.all(16)).make(),
      ),
    );
  }
}
