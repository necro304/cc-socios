
import 'dart:convert';
import 'package:css_socios/app/data/models/benefit_model.dart';
import 'package:css_socios/app/data/models/bodies_auth.dart';
import 'package:css_socios/app/data/models/qr_model.dart';
import 'package:css_socios/app/data/providers/dev/api_benefit_dev_provider.dart';
import 'package:css_socios/app/data/providers/dev/api_qr_dev_provider.dart';
import 'package:css_socios/app/data/providers/dev/api_virtual_card_dev_provider.dart';
import 'package:get/get.dart';

class ApiRepository extends GetxService{
  final ApiVirtualCardDevProvider _apiDevProvider = Get.find<ApiVirtualCardDevProvider>();
  final ApiBenefitDevProvider _apiBenefitDevProvider = Get.find<ApiBenefitDevProvider>();
  final ApiQrdDevProvider _apiQrdDevProvider = Get.find<ApiQrdDevProvider>();

  Future getCard(BodyCard body) async {
    try{
      final response = await _apiDevProvider.validateCard(body);
      final responseDecode = json.decode(response.body);
      final responseCode = responseDecode['RespuestaCode'];
      final responseCodeDes = responseDecode['DescripcionRespuesta'];
      if(responseCode == "000"){
        return responseCardFromJson(response.body);
      }else{
        if(responseCodeDes is String && responseCode  is String){
          return throw(ResponseCardError(respuestaCode: responseCode, descripcionRespuesta: responseCodeDes));
        }else{
          print('error 1');
          throw(ResponseCardError(respuestaCode: null, descripcionRespuesta: "Error en el sistema"));
        }
      }
    }catch(e){
      if(e is ResponseCardError){
        throw(e);
      }{
        throw(ResponseCardError(respuestaCode: null, descripcionRespuesta: "Error en el sistema"));
      }
    }
  }

  Future<BenefitCategoryResponse> getBenefitsCategory() async {
    try{
      final response = await _apiBenefitDevProvider.benefitCategory();
      final responseDecode = json.decode(response.body);
      final responseCode = responseDecode['RespuestaCode'];
      final responseCodeDes = responseDecode['DescripcionRespuesta'];
      if(responseCode == "000"){
        return benefitCategoryResponseFromJson(response.body);
      }else{
        if(responseCodeDes is String && responseCode  is String){
          return throw(ResponseCardError(respuestaCode: responseCode, descripcionRespuesta: responseCodeDes));
        }else{
          throw(ResponseCardError(respuestaCode: null, descripcionRespuesta: "Error en el sistema"));
        }
      }
    }catch(e){
      if(e is ResponseCardError){
        throw(e);
      }{
        throw(ResponseCardError(respuestaCode: null, descripcionRespuesta: "Error en el sistema"));
      }
    }
  }

  Future<ResponseBenefit> getBenefits(int category) async {
    try{
      final response = await _apiBenefitDevProvider.benefits(BodyBenefit(idCategoria: category));
      final responseDecode = json.decode(response.body);
      final responseCode = responseDecode['RespuestaCode'];
      final responseCodeDes = responseDecode['DescripcionRespuesta'];
      if(responseCode == "000"){
        return responseBenefitFromJson(response.body);
      }else{
        if(responseCodeDes is String && responseCode  is String){
          return throw(ResponseCardError(respuestaCode: responseCode, descripcionRespuesta: responseCodeDes));
        }else{
          throw(ResponseCardError(respuestaCode: null, descripcionRespuesta: "Error en el sistema"));
        }
      }
    }catch(e){
      if(e is ResponseCardError){
        throw(e);
      }{
        throw(ResponseCardError(respuestaCode: null, descripcionRespuesta: "Error en el sistema"));
      }
    }
  }

  Future<ResponseOtp> getOtpCode(BodyOtp body) async {
    try{
      final response = await _apiQrdDevProvider.generateOtp(body);
      final responseDecode = json.decode(response.body);
      final responseCode = responseDecode['RespuestaCode'];
      final responseCodeDes = responseDecode['DescripcionRespuesta'];
      if(responseCode == "000"){
        return responseOtpFromJson(response.body);
      }else{
        if(responseCodeDes is String && responseCode  is String){
          return throw(ResponseCardError(respuestaCode: responseCode, descripcionRespuesta: responseCodeDes));
        }else{
          throw(ResponseCardError(respuestaCode: null, descripcionRespuesta: "Error en el sistema"));
        }
      }
    }catch(e){
      if(e is ResponseCardError){
        throw(e);
      }{
        throw(ResponseCardError(respuestaCode: null, descripcionRespuesta: "Error en el sistema"));
      }
    }
  }


}