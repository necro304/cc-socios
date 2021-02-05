import 'package:get/get.dart';
import 'package:css_socios/app/modules/benefit/controllers/benefit_controller.dart';
import 'package:css_socios/app/modules/benefit/controllers/category_controller.dart';

class BenefitBinding extends Bindings {
  @override
  void dependencies() {
		Get.lazyPut<CategoryController>(
			() => CategoryController(),
		);
    Get.lazyPut<BenefitController>(
      () => BenefitController(),
    );
  }
}