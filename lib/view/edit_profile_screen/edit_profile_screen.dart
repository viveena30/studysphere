import 'package:mcwc/const/const.dart';
import 'package:mcwc/controller/profile_controller.dart';

import '../../validator/validators.dart';
import '../../widget_common/custom_elevated_button.dart';
import '../../widget_common/custom_text_form_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  ValidatorFunctions validatorFunctions = ValidatorFunctions();
  final _formKey = GlobalKey<FormState>();
  ProfileController profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: lightGreyColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
        title: "Edit Profile"
            .text
            .color(whiteColor)
            .size(24)
            .fontFamily(bold)
            .make(),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          profileGirl,
                          height: context.screenHeight * 0.15,
                          fit: BoxFit.cover,
                        )
                            .box
                            .roundedFull
                            .clip(Clip.antiAlias)
                            .make()
                            .box
                            .roundedFull
                            .border(
                              color: primaryColor,
                              style: BorderStyle.solid,
                              width: 2,
                            )
                            .outerShadowLg
                            .make(),
                        // change image button
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.camera_alt_rounded,
                              color: whiteColor,
                              size: 20,
                            ),
                          )
                              .box
                              .roundedFull
                              .color(primaryColor)
                              .size(40, 40)
                              .make(),
                        ),
                      ],
                    ),
                    10.heightBox,
                    const Divider(),
                    10.heightBox,
                    // rest of the fields
                    customTextFormField(
                      title: "What's your first Name?",
                      hint: "Enter your first name",
                      validator: validatorFunctions.validateName,
                      controller: profileController.firstNameController,
                    ),
                    20.heightBox,
                    customTextFormField(
                      title: "And your last Name?",
                      hint: "Enter your last name",
                      validator: validatorFunctions.validateName,
                      controller: profileController.lastNameController,
                    ),
                    20.heightBox,
                    customTextFormField(
                      title: "Which City are you from?",
                      hint: "Enter name of your City",
                      validator: validatorFunctions.validateName,
                      controller: profileController.cityController,
                    ),
                    20.heightBox,
                    customTextFormField(
                      title: "And which Country?",
                      hint: "Enter name of your Country",
                      validator: validatorFunctions.validateName,
                      controller: profileController.countryController,
                    ),
                    20.heightBox,

                    customElevatedButton(
                      label: "Save",
                      onPress: () async {
                        if (_formKey.currentState!.validate()) {
                          profileController.updateProfile();
                          VxToast.show(context, msg: "Profile Updated");
                          Get.back();
                        }
                      },
                      color: primaryColor,
                      textColor: whiteColor,
                    ),
                  ],
                ),
              ).box.height(context.screenHeight * 0.7).make(),
            ],
          )
              .box
              .rounded
              .outerShadow
              .padding(const EdgeInsets.all(16))
              .margin(EdgeInsets.only(top: context.screenWidth * 0.1))
              .color(whiteColor)
              // .width(context.screenWidth * 0.8)
              .size(context.screenWidth * 0.8, context.screenHeight * 0.8)
              .make(),
        ),
      ),
    );
  }
}
