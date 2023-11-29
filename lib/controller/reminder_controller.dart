import 'package:mcwc/const/const.dart';

class ReminderController extends GetxController {
  var reminderList = <Reminder>[
    Reminder(title: "", time: "06:00 AM"),
    Reminder(title: "", time: "07:00 AM"),
    Reminder(title: "", time: "08:00 AM"),
    Reminder(title: "check Emails", time: "09:00 AM"),
    Reminder(title: "", time: "10:00 AM"),
    Reminder(title: "", time: "11:00 AM"),
    Reminder(title: "Start The Project", time: "12:00 PM"),
    Reminder(title: "", time: "01:00 PM"),
    Reminder(title: "Practice DSA", time: "02:00 PM"),
    Reminder(title: "", time: "03:00 PM"),
    Reminder(title: "Attend the Meeting", time: "04:00 PM"),
    Reminder(title: "", time: "05:00 PM"),
    Reminder(title: "", time: "06:00 PM"),
    Reminder(title: "", time: "07:00 PM"),
    Reminder(title: "Watch the Daily vlog", time: "08:00 PM"),
    Reminder(title: "", time: "09:00 PM"),
    Reminder(title: "", time: "10:00 PM"),
    Reminder(title: "", time: "11:00 PM"),
  ].obs;
}

class Reminder {
  final String title;
  final String time;

  Reminder({required this.title, required this.time});
}
