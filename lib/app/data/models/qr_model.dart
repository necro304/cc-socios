// To parse this JSON data, do
//
//     final bodyOtp = bodyOtpFromJson(jsonString);

import 'dart:convert';

BodyOtp bodyOtpFromJson(String str) => BodyOtp.fromJson(json.decode(str));

String bodyOtpToJson(BodyOtp data) => json.encode(data.toJson());

class BodyOtp {
  BodyOtp({
    this.idSocio,
    this.idUsuario,
  });

  int idSocio;
  int idUsuario;

  factory BodyOtp.fromJson(Map<String, dynamic> json) => BodyOtp(
    idSocio: json["IdSocio"],
    idUsuario: json["IdUsuario"],
  );

  Map<String, dynamic> toJson() => {
    "IdSocio": idSocio,
    "IdUsuario": idUsuario,
  };
}

ResponseOtp responseOtpFromJson(String str) => ResponseOtp.fromJson(json.decode(str));

String responseOtpToJson(ResponseOtp data) => json.encode(data.toJson());

class ResponseOtp {
  ResponseOtp({
    this.respuestaCode,
    this.descripcionRespuesta,
    this.otp,
  });

  String respuestaCode;
  String descripcionRespuesta;
  String otp;

  factory ResponseOtp.fromJson(Map<String, dynamic> json) => ResponseOtp(
    respuestaCode: json["RespuestaCode"],
    descripcionRespuesta: json["DescripcionRespuesta"],
    otp: json["OTP"],
  );

  Map<String, dynamic> toJson() => {
    "RespuestaCode": respuestaCode,
    "DescripcionRespuesta": descripcionRespuesta,
    "OTP": otp,
  };
}

