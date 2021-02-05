import 'package:css_socios/app/modules/benefit/views/benefit_view.dart';
import 'package:css_socios/app/modules/benefit/bindings/benefit_binding.dart';
import 'package:css_socios/app/modules/benefit/views/category_view_view.dart';

import 'package:css_socios/app/modules/login/views/login_view.dart';
import 'package:css_socios/app/modules/login/bindings/login_binding.dart';
import 'package:css_socios/app/modules/home/views/home_view.dart';
import 'package:css_socios/app/modules/home/bindings/home_binding.dart';
import 'package:css_socios/app/modules/virtualCard/bindings/virtual_card_binding.dart';
import 'package:css_socios/app/modules/virtualCard/views/virtual_card_view.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  
static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: Routes.HOME, 
      page:()=> HomeView(), 
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.LOGIN, 
      page:()=> LoginView(), 
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.VIRTUAL_CARD, 
      page:()=> VirtualCardView(),
      binding: VirtualCardBinding(),
    ),
    GetPage(
      name: Routes.BENEFIT, 
      page:()=> BenefitView(), 
      binding: BenefitBinding(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: Routes.BENEFIT_CATEGORY,
      page:()=> CategoryView(),
      binding: BenefitBinding(),
    ),
  ];
}