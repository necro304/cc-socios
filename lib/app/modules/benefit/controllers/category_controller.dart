import 'package:css_socios/app/data/models/benefit_model.dart';
import 'package:css_socios/app/data/models/bodies_auth.dart';
import 'package:css_socios/app/data/repositories/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  final ApiRepository _apiRepository = Get.find<ApiRepository>();

  RxList<Categoria> categories = List<Categoria>().obs;

  @override
  void onInit() {
    getBenefitsCategory();
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  Future getBenefitsCategory() async {
    try{
      final BenefitCategoryResponse response = await _apiRepository.getBenefitsCategory();
      this.categories.addAll(response.categorias);
    }on ResponseCardError catch(e){
      Get.dialog(AlertDialog(
        title: Text('Error'),
        content:Text(e.descripcionRespuesta, style: TextStyle(color: Colors.black54),),
        actions: [RaisedButton(onPressed: () => Get.back(), child: Text('Ok'),)],)
      );
    }
  }

}
