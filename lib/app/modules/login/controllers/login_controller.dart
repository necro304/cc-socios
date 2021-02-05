import 'dart:convert';

import 'package:css_socios/app/data/models/bodies_auth.dart';
import 'package:css_socios/app/data/repositories/auth_repository.dart';
import 'package:css_socios/app/data/repositories/storage_repository.dart';
import 'package:css_socios/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';
import 'package:crypto/crypto.dart';

class LoginController extends GetxController {

  final AuthRepository _authRepository = Get.find<AuthRepository>();
  final StorageRepository _storageRepository = Get.find<StorageRepository>();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool busy = false.obs;
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  RxBool checkBiometrics = false.obs;
  RxList<BiometricType> availableBiometrics = List<BiometricType>().obs;

  RxBool authBio = false.obs;

  var localAuth = LocalAuthentication();


  void onInit() async {
    print(_storageRepository.authBio);
    if(_storageRepository.authBio != null && _storageRepository.authBio){
      authBio.value = true;
    }

    checkBiometrics.value = await localAuth.canCheckBiometrics;
    final biometrics = await localAuth.getAvailableBiometrics();

    availableBiometrics.addAll(biometrics);

    print(checkBiometrics.value);
    super.onInit();
  }

  localAuthenticationFunction() async {
    final androidStrings  = AndroidAuthMessages(
      cancelButton: 'Cancelar',
      signInTitle: 'Inicio de sesión',
      goToSettingsButton: 'Ir a configurar',
      fingerprintHint: 'Sensor de huella dactilar',
      fingerprintSuccess: 'Acceso consedido',
    );
    bool didAuthenticate =
        await localAuth.authenticateWithBiometrics(
          androidAuthStrings: androidStrings,
        localizedReason: 'Autentíquese para ingresar');
    if(didAuthenticate){
      final userCredentialStorage = _storageRepository.userCredentials;
      try{
        print(userCredentialStorage.passwordSocio);
        print(userCredentialStorage.emailSocio);
        final user = await _authRepository.login(
            BodyLogin(
                emailSocio: userCredentialStorage.emailSocio,
                passwordSocio: userCredentialStorage.passwordSocio
            )
        );
        _storageRepository.updateResponseUser(user);

        Get.offAllNamed(Routes.VIRTUAL_CARD);

      }on ResponseLoginError catch(e){
        Get.dialog(
            AlertDialog(
              title: Text('Erorr'),
              content: Text(e.descripcionRespuesta),
              actions: [
                MaterialButton(
                    onPressed:()=> Get.back(),
                    color: Colors.redAccent
                    , child: Text('cerrar', style: TextStyle(color: Colors.white),)
                )
              ],
            )
        );
      }
    }
  }

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  Future submit() async {
    busy.value = true;
    FocusScope.of(Get.context).requestFocus(FocusNode());
    if(formKey.currentState.validate()){
      print(generateMd5(passwordController.text.trim()));
      print(passwordController.text.trim());
      print(emailController.text.trim());
     try{
       final user = await _authRepository.login(
           BodyLogin(
               emailSocio: emailController.text,
               passwordSocio: generateMd5(passwordController.text.trim())
           )
       );
        _storageRepository.updateResponseUser(user);
       if(_storageRepository.userCredentials != null && _storageRepository.userCredentials.emailSocio != null && emailController.text != _storageRepository.userCredentials.emailSocio){
         authBio.value = false;
       }
       _storageRepository.updateBioAuth(authBio.value);
       _storageRepository.updateUser(
           BodyLogin(
           emailSocio: emailController.text,
           passwordSocio: generateMd5(passwordController.text.trim())
       ));
       busy.value = false;
       Get.offAllNamed(Routes.VIRTUAL_CARD);
     }on ResponseLoginError catch(e){
       Get.dialog(
           AlertDialog(
             title: Text('Erorr'),
             content: Text(e.descripcionRespuesta),
             actions: [
               MaterialButton(
                   onPressed:()=> Get.back(),
                   color: Colors.redAccent
                   , child: Text('cerrar', style: TextStyle(color: Colors.white),)
               )
             ],
           )
       );
       busy.value = false;
     }
    }else{
      busy.value = false;
    }
  }

}
