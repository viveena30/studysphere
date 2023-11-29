import 'package:mcwc/const/const.dart';
import 'package:mcwc/controller/profile_controller.dart';

import '../edit_profile_screen/edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.find<ProfileController>();
    return Scaffold(
      backgroundColor: lightGreyColor,
      body: SingleChildScrollView(
        // physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                // background image
                Image.asset(backgroundMumbai, fit: BoxFit.cover),

                // gradient
                Container(
                  height: Get.height * 0.57,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.3),
                        Colors.black.withOpacity(0.7),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),

                // actual profile screen starts here
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: whiteColor,
                            size: 30,
                          ),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit,
                              color: whiteColor, size: 30),
                          onPressed: () {
                            profileController.firstNameController.text =
                                profileController.firstName.value;
                            profileController.lastNameController.text =
                                profileController.lastName.value;
                            profileController.cityController.text =
                                profileController.city.value;
                            profileController.countryController.text =
                                profileController.country.value;
                            Get.to(() => const EditProfileScreen());
                          },
                        ),
                      ],
                    )
                        .box
                        .margin(const EdgeInsets.only(
                            top: 50, left: 16, right: 16, bottom: 20))
                        .make(),

                    // profile image
                    Image.asset(profileGirl, fit: BoxFit.cover)
                        .box
                        .height(150)
                        .clip(Clip.antiAlias)
                        .roundedFull
                        .shadow5xl
                        .make(),

                    // name and location
                    Obx(
                      () => Column(
                        children: [
                          "${profileController.firstName.value} ${profileController.lastName.value}"
                              .text
                              .color(whiteColor)
                              .size(30)
                              .fontFamily(bold)
                              .make(),
                          5.heightBox,
                          "${profileController.city.value}, ${profileController.country.value}"
                              .text
                              .color(whiteColor)
                              .size(20)
                              .fontFamily(semiBold)
                              .make(),
                        ],
                      )
                          .box
                          .margin(const EdgeInsets.only(top: 20, bottom: 10))
                          .make(),
                    ),

                    // reminders, tasks, events, solutions
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        profileNumericTile(
                          icon: Icons.notifications_active_outlined,
                          title: "Rems",
                          value: "10",
                        ),
                        profileNumericTile(
                          icon: Icons.checklist_outlined,
                          title: "Tasks",
                          value: "13",
                        ),
                        profileNumericTile(
                          icon: Icons.event_outlined,
                          title: "Events",
                          value: "05",
                        ),
                        profileNumericTile(
                          icon: Icons.lightbulb_outline,
                          title: "Sols",
                          value: "07",
                        ),
                      ],
                    ).box.margin(const EdgeInsets.only(top: 20)).make(),

                    // about me

                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            "About"
                                .text
                                .color(darkFontGreyColor)
                                .size(24)
                                .fontFamily(bold)
                                .make(),
                            "See All >"
                                .text
                                .color(primaryColor)
                                .size(16)
                                .fontFamily(semiBold)
                                .make(),
                          ],
                        ),

                        20.heightBox,
                        // about me text
                        "Enthusiastic explorer of life's diverse pathways, Laxmi Shah is a soul deeply intertwined with the vibrant heartbeat of Mumbai, India. With an unquenchable thirst for knowledge and a heart that beats for creativity, Laxmi is an individual whose essence defies easy categorization..."
                            .text
                            .color(fontGreyColor)
                            .size(16)
                            .make(),
                      ],
                    )
                        .box
                        .color(whiteColor)
                        .rounded
                        .padding(const EdgeInsets.all(16))
                        .outerShadow
                        .margin(
                            const EdgeInsets.only(left: 16, right: 16, top: 60))
                        .make(),
                    // top quote

                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            "Today's Quote"
                                .text
                                .color(darkFontGreyColor)
                                .size(24)
                                .fontFamily(bold)
                                .make(),
                            "See All >"
                                .text
                                .color(primaryColor)
                                .size(16)
                                .fontFamily(semiBold)
                                .make(),
                          ],
                        ),
                        10.heightBox,
                        Align(
                          alignment: Alignment.center,
                          child:
                              "“The best way to predict the future is to create it.”"
                                  .text
                                  .color(fontGreyColor)
                                  .size(20)
                                  .fontFamily(semiBold)
                                  .make(),
                        ),
                        5.heightBox,
                        Align(
                          alignment: Alignment.bottomRight,
                          child: "Abraham Lincoln"
                              .text
                              .color(darkFontGreyColor)
                              .size(16)
                              .fontFamily(semiBold)
                              .make(),
                        ),
                      ],
                    )
                        .box
                        .color(whiteColor)
                        .rounded
                        .padding(const EdgeInsets.all(16))
                        .outerShadow
                        .margin(
                            const EdgeInsets.only(left: 16, right: 16, top: 20))
                        .make(),

                    // achievements
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            "Achievements"
                                .text
                                .color(darkFontGreyColor)
                                .size(24)
                                .fontFamily(bold)
                                .make(),
                            "See All >"
                                .text
                                .color(primaryColor)
                                .size(16)
                                .fontFamily(semiBold)
                                .make(),
                          ],
                        ),
                        10.heightBox,
                        profileAchievementTile(
                            img: appIconColor, title: "Solved 10 problems"),
                        profileAchievementTile(
                            img: appIconColorOutlined,
                            title: "completed 15 tasks"),
                        profileAchievementTile(
                            img: appIconOutlined, title: "attended 20 events"),
                        profileAchievementTile(
                            img: icon, title: "focused for 30 hours"),
                      ],
                    )
                        .box
                        .color(whiteColor)
                        .rounded
                        .padding(const EdgeInsets.all(16))
                        .outerShadow
                        .margin(const EdgeInsets.only(
                            left: 16, right: 16, top: 20, bottom: 20))
                        .make(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column profileNumericTile(
      {required icon, required String title, required String value}) {
    return Column(
      children: [
        Icon(
          icon,
          color: whiteColor,
          size: 30,
        ),
        10.heightBox,
        title.text
            .color(whiteColor)
            .size(16)
            .fontWeight(FontWeight.w200)
            .make(),
        5.heightBox,
        value.text.color(whiteColor).size(30).fontFamily(bold).make(),
      ],
    );
  }

  Widget profileAchievementTile({required img, required String title}) {
    return ListTile(
      leading: Image.asset(
        img,
        height: 40,
        width: 40,
        fit: BoxFit.cover,
      ).box.clip(Clip.antiAlias).roundedFull.make(),
      title: title.text
          .color(darkFontGreyColor)
          .size(20)
          .fontWeight(FontWeight.w200)
          .make(),
      // 5.heightBox,
      // value.text.color(whiteColor).size(30).fontFamily(bold).make(),
    )
        .box
        .color(lightGreyColor)
        .margin(const EdgeInsets.only(bottom: 12))
        .rounded
        .make();
  }
}
