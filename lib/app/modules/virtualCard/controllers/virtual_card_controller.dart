import 'dart:convert';

import 'package:css_socios/app/data/models/bodies_auth.dart';
import 'package:css_socios/app/data/models/qr_model.dart';
import 'package:css_socios/app/data/repositories/api_repository.dart';
import 'package:css_socios/app/data/repositories/storage_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crypto/crypto.dart';

class VirtualCardController extends GetxController {
  final StorageRepository _storageRepository = Get.find<StorageRepository>();
  final ApiRepository _apiRepository = Get.find<ApiRepository>();
  GlobalKey<ScaffoldState> keyScaffold = new GlobalKey<ScaffoldState>();

  Rx<ResponseCard> card = ResponseCard().obs;
  RxString qrData = ''.obs;

  RxBool busy = true.obs;
  RxString errorMessage = ''.obs;
  RxString name = ''.obs;


  @override
  Future<void> onInit() async {
    FocusScope.of(Get.context).requestFocus(FocusNode());
    final user = _storageRepository.userResponse;
    name.value = "${user.nombres} ${user.apellidos}";
    try{
      final ResponseCard responseCard = await _apiRepository.getCard(BodyCard(idUsuario: int.parse(user.idUsuario))) as ResponseCard;
      card.update((val) {
        val.idUsuario =responseCard.idUsuario;
        val.descripcionRespuesta =responseCard.descripcionRespuesta;
        val.fechaVencimiento =responseCard.fechaVencimiento;
        val.numeroTarjeta =responseCard.numeroTarjeta;
        val.respuestaCode =responseCard.respuestaCode;
      });
      print(card.value.numeroTarjeta);
      busy.value = false;
    }on ResponseCardError catch(e){
      busy.value = false;
      errorMessage.value = e.descripcionRespuesta;
    }
    super.onInit();
  }
  @override
  void onReady() {
    if( !_storageRepository.authBio ){
      openDialogBio();
    }
    keyScaffold.currentState.openDrawer();
    super.onReady();
  }

  Future openDialogBio() async {
    await Future.delayed(Duration(seconds: 1));
    await Get.dialog(
        AlertDialog(
          title: Text('Autenticación'),
          content: Text('Deseas usar autenticación biometrica con esta cuenta'),
          actions: [
            MaterialButton(
              onPressed: ()=> Get.back(),
              child: Text('No'),
              color: Colors.redAccent,
            ),
            MaterialButton(
              onPressed: ()=> updateBioAuth(),
              child: Text('Si'),
              color: Colors.blueAccent,
            ),
          ],
        )
    );
  }

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  Future getOtp() async {
    try{
      final user = _storageRepository.userResponse;
      print("${user.idSocio};${user.idUsuario}");
      final ResponseOtp responseOtp = await _apiRepository.getOtpCode(
          BodyOtp(idSocio: int.parse(user.idSocio), idUsuario: int.parse(user.idUsuario))
      );
      print(user);

      qrData.value = "${user.idSocio};${user.idUsuario};${responseOtp.otp};${generateMd5(responseOtp.otp)}";
      print(qrData.value);
    }on ResponseCardError catch(e){
      print(e.descripcionRespuesta);
      errorMessage.value = e.descripcionRespuesta;
    }
  }



  updateBioAuth(){
    _storageRepository.updateBioAuth(true);
    Get.back();
  }

  List separateText(String text){
    var textcc = [];
    for (var i = 0; i < text.length; i+=4) {
      var fi = i + 4;
      textcc.add(text.substring(i, fi));
    }
    print(textcc);
    return textcc;
  }

}
