import 'package:mcwc/const/const.dart';
import 'package:mcwc/view/home_screen/home_screen.dart';
import 'package:mcwc/view/notes_screen/notes_screen.dart';
import 'package:mcwc/view/qna_screen/qna_screen.dart';
import 'package:mcwc/view/reminder_screen/reminder_screen.dart';

import '../../controller/home_controller.dart';
import '../../controller/profile_controller.dart';
import '../../controller/reminder_controller.dart';
import '../../widget_common/exit_dialogue.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final HomeController controller = Get.put(HomeController());
  final ProfileController profileController = Get.put(ProfileController());
  final ReminderController reminderController = Get.put(ReminderController());

  final List<BottomNavigationBarItem> navBarItems = [
    const BottomNavigationBarItem(
        icon: CircleAvatar(
          // maxRadius: 50,
          backgroundColor: whiteColor,
          foregroundColor: primaryColor,
          child: Icon(
            Icons.home,
          ),
        ),
        label: home),
    const BottomNavigationBarItem(
        icon: CircleAvatar(
            backgroundColor: whiteColor,
            foregroundColor: primaryColor,
            child: Icon(Icons.notifications)),
        label: reminder),
    const BottomNavigationBarItem(
        icon: CircleAvatar(
            backgroundColor: whiteColor,
            foregroundColor: primaryColor,
            child: Icon(Icons.checklist)),
        label: notes),
    const BottomNavigationBarItem(
        icon: CircleAvatar(
            backgroundColor: whiteColor,
            foregroundColor: primaryColor,
            child: Icon(Icons.question_answer)),
        label: qna),
  ];

  final List<Widget> navBody = [
    const HomeScreen(),
    const ReminderScreen(),
    const NotesScreen(),
    const QnaScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
            context: context, builder: (context) => exitDialogue(context));
        return false;
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Obx(
                () => navBody.elementAt(controller.currentNavIndex.value),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            selectedIconTheme: const IconThemeData(
              size: 40,
            ),
            currentIndex: controller.currentNavIndex.value,
            backgroundColor: primaryColor,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            selectedItemColor: whiteColor,
            showUnselectedLabels: false,
            // selectedItemColor: primaryColor,
            // unselectedItemColor: primaryColor,
            selectedLabelStyle: const TextStyle(
              fontFamily: semiBold,
            ),
            items: navBarItems,
            onTap: (value) {
              controller.currentNavIndex.value = value;
            },
          ),
        ),
      ),
    );
  }
}
