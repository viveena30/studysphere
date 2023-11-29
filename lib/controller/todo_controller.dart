import 'package:mcwc/const/const.dart';

class TodoController extends GetxController {
  var todos = <Todo>[
    Todo(
      title: 'solve the 3rd question',
    ),
    Todo(
      title: 'buy the blaze plan for firebase',
    ),
    Todo(
      title: 'finish the project',
    ),
  ].obs;
  TextEditingController textEditingController = TextEditingController();

  void addTodo({required String title}) {
    todos.add(Todo(
      title: title,
    ));
  }

  void removeTodo({required int index}) {
    todos.removeAt(index);
  }
}
