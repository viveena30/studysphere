import 'package:mcwc/const/const.dart';
import 'package:mcwc/controller/todo_controller.dart';

Widget tasksTile({String? title, int index = 0}) {
  final TodoController todoController = Get.find<TodoController>();
  return ListTile(
    title: title!.text.fontFamily(semiBold).color(fontGreyColor).make(),
    leading: Checkbox(
      value: todoController.todos[index].isDone,
      onChanged: (newValue) {
        todoController.todos[index].isDone = newValue!;
      },
    ),
    tileColor: lightGreyColor,
  ).box.margin(const EdgeInsets.symmetric(vertical: 4)).rounded.make();
}
