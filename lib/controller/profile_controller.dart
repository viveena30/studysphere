import 'Package:mcwc/const/const.dart';

class ProfileController extends GetxController {
  var firstName = "Laxmi".obs;
  var lastName = "Shah".obs;
  var city = "Mumbai".obs;
  var country = "India".obs;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  void updateProfile() {
    firstName.value = firstNameController.text;
    lastName.value = lastNameController.text;
    city.value = cityController.text;
    country.value = countryController.text;
    firstNameController.clear();
    lastNameController.clear();
    cityController.clear();
    countryController.clear();
  }
}
