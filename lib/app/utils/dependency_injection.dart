import 'package:css_socios/app/data/providers/dev/api_benefit_dev_provider.dart';
import 'package:css_socios/app/data/providers/dev/api_qr_dev_provider.dart';
import 'package:css_socios/app/data/providers/dev/api_virtual_card_dev_provider.dart';
import 'package:css_socios/app/data/providers/dev/auth_dev_provider.dart';
import 'package:css_socios/app/data/providers/storage_get.dart';
import 'package:css_socios/app/data/repositories/api_repository.dart';
import 'package:css_socios/app/data/repositories/auth_repository.dart';
import 'package:css_socios/app/data/repositories/storage_repository.dart';
import 'package:get/get.dart';


class DependencyInjection {
  static void init() {
    // providers
    Get.put<StorageGet>(StorageGet());
    Get.put<AuthDevProvider>(AuthDevProvider());
    Get.put<ApiVirtualCardDevProvider>(ApiVirtualCardDevProvider());
    Get.put<ApiBenefitDevProvider>(ApiBenefitDevProvider());
    Get.put<ApiQrdDevProvider>(ApiQrdDevProvider());

    /// repositories
    Get.put<StorageRepository>(StorageRepository());
    Get.put<AuthRepository>(AuthRepository());
    Get.put<ApiRepository>(ApiRepository());
  }
}