import 'package:mcwc/controller/todo_controller.dart';
import '../../const/const.dart';
import '../group_chat/group_chat_screen.dart';
import '../profile_screen/profile_screen.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    TodoController todoController = Get.find<TodoController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: notes.text.color(whiteColor).size(32).fontFamily(bold).make(),
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
          ]),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Column(
          children: [
            Expanded(
              child: Row(
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
                      addTaskDialogBox(context, todoController);
                    },
                  ),
                ],
              ).box.color(whiteColor).make(),
            ),
            Expanded(
              flex: 10,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Obx(
                      () => Column(
                        children:
                            List.generate(todoController.todos.length, (index) {
                          // return tasksTile(
                          // title: todoController.todos[index].title,
                          // index: index,
                          // );
                          return ListTile(
                            title: todoController.todos[index].isDone
                                ? todoController
                                    .todos[index].title.text.lineThrough
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
                                  todoController.todos[index].isDone =
                                      newValue!;
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
                    ),
                    10.heightBox,
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            color: fontGreyColor.withOpacity(0.5), width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        addTaskDialogBox(context, todoController);
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.add,
                          color: fontGreyColor.withOpacity(0.5),
                        ),
                        title: "add new note"
                            .text
                            .color(fontGreyColor.withOpacity(0.5))
                            .make(),
                      )
                          .box
                          .color(whiteColor)
                          // .shadowOutline(outlineColor: lightGreyColor)
                          .make(),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> addTaskDialogBox(
      BuildContext context, TodoController todoController) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text("Add Task"),
              content: TextField(
                controller: todoController.textEditingController,
                decoration: const InputDecoration(hintText: "Enter Task"),
              ),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding: const EdgeInsets.all(8),
                      elevation: 0),
                  onPressed: () {
                    if (todoController.textEditingController.text.isNotEmpty) {
                      todoController.addTodo(
                          title: todoController.textEditingController.text);
                      todoController.textEditingController.clear();
                      Get.back();
                    }
                  },
                  child: const Text("Add"),
                ),
              ],
            ));
  }
}
