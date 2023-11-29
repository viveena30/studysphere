import 'package:mcwc/const/const.dart';

Widget customElevatedButton(
    {required String? label,
    required Function()? onPress,
    Color? color,
    Color? textColor,
    bool isUsedInRow = false,
    double? textSize = 16}) {
  return SizedBox(
    width: isUsedInRow ? null : double.maxFinite,
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: color,
          padding: const EdgeInsets.all(12),
        ),
        onPressed: onPress,
        child: label!.text
            .color(textColor)
            .fontFamily(bold)
            .size(textSize)
            .make()
            .box
            .padding(const EdgeInsets.all(8))
            .make()),
  );
}
