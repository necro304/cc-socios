import 'package:css_socios/app/modules/virtualCard/controllers/virtual_card_controller.dart';
import 'package:get/get.dart';

class VirtualCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<VirtualCardController>(VirtualCardController());
  }
}
