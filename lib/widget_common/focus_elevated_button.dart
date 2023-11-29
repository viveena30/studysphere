import 'package:mcwc/const/const.dart';

Widget focusElevatedButton({
  required String? label,
  required Function()? onPress,
  Gradient? gradient, // Accepts a gradient for the background
  Color? textColor,
  bool isUsedInRow = false,
  double? textSize = 16,
}) {
  return SizedBox(
    width: isUsedInRow ? null : double.maxFinite,
    child: Container(
      decoration: BoxDecoration(
        gradient: gradient, // Apply the provided gradient
        borderRadius: BorderRadius.circular(8),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.zero, // Remove padding to prevent double padding
        ),
        onPressed: onPress,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Text(
              label!,
              style: TextStyle(
                color: textColor,
                fontFamily: bold,
                fontSize: textSize,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
