import 'package:css_socios/app/data/models/benefit_model.dart';
import 'package:css_socios/app/data/models/bodies_auth.dart';
import 'package:css_socios/app/data/repositories/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BenefitController extends GetxController {
  final ApiRepository _apiRepository = Get.find<ApiRepository>();

  RxList<Beneficio> beneficios = List<Beneficio>().obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() async {
    getBenefits();
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {
    beneficios.close();
  }


  Future getBenefits() async {
    try{
      final ResponseBenefit response = await _apiRepository.getBenefits(int.parse(Get.arguments));
      this.beneficios.addAll(response.beneficios);
    }on ResponseCardError catch(e){
      errorMessage.value = e.descripcionRespuesta;
    }
  }

}
