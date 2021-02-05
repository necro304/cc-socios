

import 'package:css_socios/app/data/models/benefit_model.dart';
import 'package:get/get.dart';

class ApiBenefitDevProvider extends GetConnect{
  final tokenCategory = 'c92ecb2b5b4ae4dd57979f233fcdf92af8653d9c73054f9ec2151442e88f7ad9';
  final tokenBenefit  = '3fc978447415bec12bdb38cac19daf55e91b7c558c87310889a2690626ccace3';

  Future<Response> benefitCategory() =>
      post('http://app.api.ccsamborondon.org/sociosCcs/webservice/comprobante/api/categoriasBeneficios',
          {},
          headers: {
            'Authentication': tokenCategory,
            'accept': 'application/json',
            'content-type': 'application/json'
          });

  Future<Response> benefits(BodyBenefit benefit) =>
      post('http://app.api.ccsamborondon.org/sociosCcs/webservice/comprobante/api/beneficiosCategorias',
          bodyBenefitToJson(benefit),
          headers: {
            'Authentication': tokenBenefit,
            'accept': 'application/json',
            'content-type': 'application/json'
          });

}