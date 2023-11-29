import 'package:mcwc/const/const.dart';
import 'package:mcwc/view/home_screen/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    changeScreen();
  }

  changeScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAll(() => Home());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (context.screenHeight * 0.4).heightBox,
            Image.asset(appIconColor, height: 150, fit: BoxFit.cover),
            20.heightBox,
            mcwc.text.color(whiteColor).size(20).fontFamily(bold).make(),
            const Spacer(),
            "Version 1.1.0".text.color(whiteColor).size(16).make(),
            20.heightBox,
          ],
        ),
      ),
    );
  }
}
