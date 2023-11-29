import 'package:mcwc/const/const.dart';

Widget customTextFormField({
  required String? title,
  required String? hint,
  controller,
  required FormFieldValidator<String?> validator,
  bool? osecurePassword = false,
  bool showIcon = false,
  Function? onTap,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(primaryColor).fontFamily(semiBold).size(24).make(),
      5.heightBox,
      TextFormField(
        validator: validator,
        obscureText: osecurePassword!,
        // keyboardType: TextInputType.emailAddress,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: showIcon
              ? IconButton(
                  onPressed: () {
                    onTap!();
                  },
                  icon: osecurePassword
                      ? const Icon(
                          Icons.visibility_off,
                          color: fontGreyColor,
                        )
                      : const Icon(
                          Icons.visibility,
                          color: primaryColor,
                        ))
              : null,
          contentPadding: const EdgeInsets.all(16),
          hintStyle: const TextStyle(
            fontFamily: semiBold,
            color: textfieldGreyColor,
          ),
          hintText: hint,
          isDense: true,
          fillColor: lightGreyColor,
          filled: true,
          border: InputBorder.none,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
          ),
        ),
      ),
    ],
  );
}
