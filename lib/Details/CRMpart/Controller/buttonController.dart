import 'package:get/get.dart';

class Buttons2Controller extends GetxController {
  var isPressed = false.obs;

  void togglePressed() {
    isPressed.value = !isPressed.value;
  }
}
