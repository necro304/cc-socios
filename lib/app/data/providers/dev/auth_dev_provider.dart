

import 'package:css_socios/app/data/models/bodies_auth.dart';
import 'package:get/get.dart';

class AuthDevProvider extends GetConnect {
  final token = '7f37a536a01a66e273f490be135146dfb158b5eeee8e27a45a7ea6e7c112b58a';

  Future<Response> loginUser(BodyLogin body) =>
      post('http://app.api.ccsamborondon.org/sociosCcs/webservice/comprobante/api/inicioSesion',
          bodyLoginToJson(body),
          headers: {
            'Authentication': token,
            'accept': 'application/json',
            'content-type': 'application/json'
          }
          );


}