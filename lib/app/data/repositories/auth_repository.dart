

import 'dart:convert';

import 'package:css_socios/app/data/models/bodies_auth.dart';
import 'package:css_socios/app/data/providers/dev/auth_dev_provider.dart';
import 'package:get/get.dart';

class AuthRepository extends GetxService{
  final AuthDevProvider _authDevProvider = Get.find<AuthDevProvider>();

  Future login(BodyLogin body) async{
    try{
      final response = await _authDevProvider.loginUser(body);
      final responseDecode = json.decode(response.body);
      final responseCode = responseDecode['RespuestaCode'];
      final responseCodeDes = responseDecode['DescripcionRespuesta'];
      if(responseCode == "000"){
        return responseLoginFromJson(response.body);
      }else{
        if(responseCodeDes is String && responseCode  is String){
          throw(ResponseLoginError(respuestaCode: responseCode, descripcionRespuesta: responseCodeDes));
        }else{
          throw(ResponseLoginError(respuestaCode: null, descripcionRespuesta: "Error en el sistema"));
        }
      }
    }catch(e){
      if(e is ResponseLoginError){
        throw(e);
      }{
        throw(ResponseLoginError(respuestaCode: null, descripcionRespuesta: "Error en el sistema"));
      }
    }
  }

}