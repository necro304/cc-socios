

import 'package:css_socios/app/data/models/bodies_auth.dart';
import 'package:css_socios/app/data/providers/storage_get.dart';
import 'package:get/get.dart';

class StorageRepository extends GetxService{

  final StorageGet _storageGet = Get.find<StorageGet>();

  bool get authBio => _storageGet.bioAuth();

  BodyLogin get  userCredentials  => _storageGet.userCredentials();

  ResponseLogin get  userResponse => _storageGet.userResponse();


  updateBioAuth(bool value){
    _storageGet.setBioAuth(value);
  }
  updateUser(BodyLogin login){
    _storageGet.setUser(login);
  }

  updateResponseUser(ResponseLogin login){
    _storageGet.setResponseUser(login);
  }

}