import 'package:css_socios/app/data/models/qr_model.dart';
import 'package:get/get.dart';

class ApiQrdDevProvider extends GetConnect{
  final token = '817aa6e0bc97d9d4c69f0d524fa09222aed0b971f6e866901c97c136ec319916';

  Future<Response> generateOtp(BodyOtp body) =>
      post('http://app.api.ccsamborondon.org/sociosCcs/webservice/comprobante/api/generarOTP',
          bodyOtpToJson(body),
          headers: {
            'Authentication': token,
            'accept': 'application/json',
            'content-type': 'application/json'
          });

}