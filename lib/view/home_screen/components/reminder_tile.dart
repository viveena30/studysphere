import 'package:mcwc/const/const.dart';

Widget reminderTile({String? title, String? time}) {
  return ListTile(
    title: title!.text.fontFamily(semiBold).color(fontGreyColor).make(),
    trailing: time!.text.color(fontGreyColor).make(),
    tileColor: lightGreyColor,
  ).box.margin(const EdgeInsets.symmetric(vertical: 4)).rounded.make();
}
