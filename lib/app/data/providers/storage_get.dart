

import 'package:css_socios/app/data/models/bodies_auth.dart';
import 'package:get_storage/get_storage.dart';

class StorageGet{
  final _box = GetStorage();

  bool bioAuth(){
    return _box.read('bioauth');
  }
  setBioAuth(bool value){
    _box.write('bioauth', value);
  }

  BodyLogin userCredentials(){
  var user = _box.read('user');
    if(user != null){
      return bodyLoginFromJson(user);
    }else{
      return BodyLogin();
    }
  }

  setUser(BodyLogin login){
    _box.write('user', bodyLoginToJson(login));
  }


  ResponseLogin userResponse(){
    var user = _box.read('user-response');
    if(user != null){
      return responseLoginFromJson(user);
    }else{
      return ResponseLogin();
    }
  }

  setResponseUser(ResponseLogin login){
    _box.write('user-response', responseLoginToJson(login));
  }
}