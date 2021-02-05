
import 'dart:convert';

BenefitCategoryResponse benefitCategoryResponseFromJson(String str) => BenefitCategoryResponse.fromJson(json.decode(str));

String benefitCategoryResponseToJson(BenefitCategoryResponse data) => json.encode(data.toJson());

class BenefitCategoryResponse {
  BenefitCategoryResponse({
    this.respuestaCode,
    this.descripcionRespuesta,
    this.categorias,
  });

  String respuestaCode;
  String descripcionRespuesta;
  List<Categoria> categorias;

  factory BenefitCategoryResponse.fromJson(Map<String, dynamic> json) => BenefitCategoryResponse(
    respuestaCode: json["RespuestaCode"],
    descripcionRespuesta: json["DescripcionRespuesta"],
    categorias: List<Categoria>.from(json["Categorias"].map((x) => Categoria.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "RespuestaCode": respuestaCode,
    "DescripcionRespuesta": descripcionRespuesta,
    "Categorias": List<dynamic>.from(categorias.map((x) => x.toJson())),
  };
}

class Categoria {
  Categoria({
    this.idCategoria,
    this.nombre,
    this.icono,
  });

  String idCategoria;
  String nombre;
  String icono;

  factory Categoria.fromJson(Map<String, dynamic> json) => Categoria(
    idCategoria: json["IdCategoria"],
    nombre: json["Nombre"],
    icono: json["Icono"],
  );

  Map<String, dynamic> toJson() => {
    "IdCategoria": idCategoria,
    "Nombre": nombre,
    "Icono": icono,
  };
}

BodyBenefit bodyBenefitFromJson(String str) => BodyBenefit.fromJson(json.decode(str));

String bodyBenefitToJson(BodyBenefit data) => json.encode(data.toJson());

class BodyBenefit {
  BodyBenefit({
    this.idCategoria,
  });

  int idCategoria;

  factory BodyBenefit.fromJson(Map<String, dynamic> json) => BodyBenefit(
    idCategoria: json["IdCategoria"],
  );

  Map<String, dynamic> toJson() => {
    "IdCategoria": idCategoria,
  };
}

ResponseBenefit responseBenefitFromJson(String str) => ResponseBenefit.fromJson(json.decode(str));

String responseBenefitToJson(ResponseBenefit data) => json.encode(data.toJson());

class ResponseBenefit {
  ResponseBenefit({
    this.respuestaCode,
    this.descripcionRespuesta,
    this.beneficios,
  });

  String respuestaCode;
  String descripcionRespuesta;
  List<Beneficio> beneficios;

  factory ResponseBenefit.fromJson(Map<String, dynamic> json) => ResponseBenefit(
    respuestaCode: json["RespuestaCode"],
    descripcionRespuesta: json["DescripcionRespuesta"],
    beneficios: List<Beneficio>.from(json["Beneficios"].map((x) => Beneficio.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "RespuestaCode": respuestaCode,
    "DescripcionRespuesta": descripcionRespuesta,
    "Beneficios": List<dynamic>.from(beneficios.map((x) => x.toJson())),
  };
}

class Beneficio {
  Beneficio({
    this.idBeneficio,
    this.idConvenio,
    this.descripcionCorta,
    this.imagen,
  });

  String idBeneficio;
  String idConvenio;
  String descripcionCorta;
  String imagen;

  factory Beneficio.fromJson(Map<String, dynamic> json) => Beneficio(
    idBeneficio: json["IdBeneficio"],
    idConvenio: json["IdConvenio"],
    descripcionCorta: json["DescripcionCorta"],
    imagen: json["Imagen"],
  );

  Map<String, dynamic> toJson() => {
    "IdBeneficio": idBeneficio,
    "IdConvenio": idConvenio,
    "DescripcionCorta": descripcionCorta,
    "Imagen": imagen,
  };
}


