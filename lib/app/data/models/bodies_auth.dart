import 'dart:convert';


BodyLogin bodyLoginFromJson(String str) => BodyLogin.fromJson(json.decode(str));

String bodyLoginToJson(BodyLogin data) => json.encode(data.toJson());

class BodyLogin {
  BodyLogin({
    this.emailSocio,
    this.passwordSocio,
  });

  String emailSocio;
  String passwordSocio;

  factory BodyLogin.fromJson(Map<String, dynamic> json) => BodyLogin(
    emailSocio: json["EmailSocio"],
    passwordSocio: json["PasswordSocio"],
  );

  Map<String, dynamic> toJson() => {
    "EmailSocio": emailSocio,
    "PasswordSocio": passwordSocio,
  };
}

ResponseLogin responseLoginFromJson(String str) => ResponseLogin.fromJson(json.decode(str));

String responseLoginToJson(ResponseLogin data) => json.encode(data.toJson());
class ResponseLogin {
  ResponseLogin({
    this.email,
    this.apellidos,
    this.nombres,
    this.cedulaPasaporte,
    this.idSocio,
    this.idUsuario,
    this.respuestaCode,
    this.descripcionRespuesta,
  });

  String email;
  String apellidos;
  String nombres;
  String cedulaPasaporte;
  String idSocio;
  String idUsuario;
  String respuestaCode;
  String descripcionRespuesta;

  factory ResponseLogin.fromJson(Map<String, dynamic> json) => ResponseLogin(
    email: json["Email"],
    apellidos: json["Apellidos"],
    nombres: json["Nombres"],
    cedulaPasaporte: json["CedulaPasaporte"],
    idSocio: json["IdSocio"],
    idUsuario: json["IdUsuario"],
    respuestaCode: json["RespuestaCode"],
    descripcionRespuesta: json["DescripcionRespuesta"],
  );

  Map<String, dynamic> toJson() => {
    "Email": email,
    "Apellidos": apellidos,
    "Nombres": nombres,
    "CedulaPasaporte": cedulaPasaporte,
    "IdSocio": idSocio,
    "IdUsuario": idUsuario,
    "RespuestaCode": respuestaCode,
    "DescripcionRespuesta": descripcionRespuesta,
  };
}

ResponseLoginError responseLoginErrorFromJson(String str) => ResponseLoginError.fromJson(json.decode(str));

String responseLoginErrorToJson(ResponseLoginError data) => json.encode(data.toJson());

class ResponseLoginError {
  ResponseLoginError({
    this.respuestaCode,
    this.descripcionRespuesta,
  });

  String respuestaCode;
  String descripcionRespuesta;

  factory ResponseLoginError.fromJson(Map<String, dynamic> json) => ResponseLoginError(
    respuestaCode: json["RespuestaCode"],
    descripcionRespuesta: json["DescripcionRespuesta"],
  );

  Map<String, dynamic> toJson() => {
    "RespuestaCode": respuestaCode,
    "DescripcionRespuesta": descripcionRespuesta,
  };
}

ResponseCard responseCardFromJson(String str) => ResponseCard.fromJson(json.decode(str));

String responseCardToJson(ResponseCard data) => json.encode(data.toJson());

class ResponseCard {
  ResponseCard({
    this.idUsuario,
    this.numeroTarjeta,
    this.fechaVencimiento,
    this.respuestaCode,
    this.descripcionRespuesta,
  });

  String idUsuario;
  String numeroTarjeta;
  String fechaVencimiento;
  String respuestaCode;
  String descripcionRespuesta;

  factory ResponseCard.fromJson(Map<String, dynamic> json) => ResponseCard(
    idUsuario: json["IdUsuario"],
    numeroTarjeta: json["NumeroTarjeta"],
    fechaVencimiento: json["FechaVencimiento"],
    respuestaCode: json["RespuestaCode"],
    descripcionRespuesta: json["DescripcionRespuesta"],
  );

  Map<String, dynamic> toJson() => {
    "IdUsuario": idUsuario,
    "NumeroTarjeta": numeroTarjeta,
    "FechaVencimiento": fechaVencimiento,
    "RespuestaCode": respuestaCode,
    "DescripcionRespuesta": descripcionRespuesta,
  };
}

ResponseCardError responseCardErrorFromJson(String str) => ResponseCardError.fromJson(json.decode(str));

String responseCardErrorToJson(ResponseCardError data) => json.encode(data.toJson());

class ResponseCardError {
  ResponseCardError({
    this.respuestaCode,
    this.descripcionRespuesta,
  });

  String respuestaCode;
  String descripcionRespuesta;

  factory ResponseCardError.fromJson(Map<String, dynamic> json) => ResponseCardError(
    respuestaCode: json["RespuestaCode"],
    descripcionRespuesta: json["DescripcionRespuesta"],
  );

  Map<String, dynamic> toJson() => {
    "RespuestaCode": respuestaCode,
    "DescripcionRespuesta": descripcionRespuesta,
  };
}

BodyCard bodyCardFromJson(String str) => BodyCard.fromJson(json.decode(str));

String bodyCardToJson(BodyCard data) => json.encode(data.toJson());

class BodyCard {
  BodyCard({
    this.idUsuario,
  });

  int idUsuario;

  factory BodyCard.fromJson(Map<String, dynamic> json) => BodyCard(
    idUsuario: json["IdUsuario"],
  );

  Map<String, dynamic> toJson() => {
    "IdUsuario": idUsuario,
  };
}



