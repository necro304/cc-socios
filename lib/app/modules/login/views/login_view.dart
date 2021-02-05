import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:css_socios/app/modules/login/controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {

  final emailMultiValidator = MultiValidator([
    RequiredValidator(errorText: 'Este campo es requerido'),
    EmailValidator(errorText: 'Introduzca una dirección de correo electrónico válida'),
  ]);

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Este campo es requerido'),
    MinLengthValidator(3, errorText: 'la contraseña debe tener al menos 3 dígitos')
  ]);


  Widget _submitButton() {
    return GestureDetector(
      onTap: () {
      },
      child: Container(
        height: ScreenUtil().setHeight(100),
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.green, Colors.lightGreen])),
        child: controller.busy.value
            ? CircularProgressIndicator()
            : Text(
          'Ingresar',
          style: TextStyle(fontSize: ScreenUtil().setSp(35), color: Colors.white),
        ),
      ),
    );
  }

  Widget _loginButton() {
    return Obx(()=>
      Stack(
        children: [
          MaterialButton(
              onPressed: (){
                controller.submit();
              },
            color: Colors.blue,
            minWidth:  double.infinity,
            height: ScreenUtil().setHeight(80),
            elevation: 0,
            child: controller.busy.value ? CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),) : Text(
              'Ingresar',
              style: TextStyle(fontSize: ScreenUtil().setSp(35), color: Colors.yellowAccent),
            ),
          ),
          Positioned(
            right: 0,
              child: GestureDetector(
                onTap: ()=> controller.submit(),
                child: Image.asset('assets/images/3lineas.png',
                  fit: BoxFit.fill,
                  height: ScreenUtil().setHeight(80),
                ),
              ),
          )
        ],
      ),
    );

  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Correo electronico',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontSize: ScreenUtil().setSp(30)),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              Container(
                height: ScreenUtil().setHeight(120),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: controller.emailController,
                  obscureText: false,
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(fontSize: ScreenUtil().setSp(30), ),
                  decoration: InputDecoration(
                    //contentPadding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(10), horizontal: ScreenUtil().setWidth(20)),
                      border: InputBorder.none,
                      errorStyle: TextStyle(color: Colors.red, fontSize: ScreenUtil().setSp(20)),
                      fillColor: Color(0xfff3f3f4),
                      filled: true),
                  validator: emailMultiValidator,
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Contraseña',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontSize: ScreenUtil().setSp(30)),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              Container(
                height: ScreenUtil().setHeight(120),
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  controller: controller.passwordController,
                  obscureText: true,
                  style: TextStyle(fontSize: ScreenUtil().setSp(30)),
                  decoration: InputDecoration(
                    // contentPadding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(10), horizontal: ScreenUtil().setWidth(20)),
                      border: InputBorder.none,
                      fillColor: Color(0xfff3f3f4),
                      errorStyle: TextStyle(color: Colors.red, fontSize: ScreenUtil().setSp(20)),
                      filled: true),
                  validator: passwordValidator,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _createAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(30)),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '¿No tienes cuenta?',
            style: TextStyle(
                fontSize: ScreenUtil().setSp(30),
                color: Colors.black54,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(23),
          ),
          InkWell(
            onTap: () {
             // Get.offNamed(Routes.REGISTER);
            },
            child: Text(
              'Registrate',
              style: TextStyle(
                  color: Color(0xff8185EA),
                  fontSize: ScreenUtil().setSp(30),
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white, //or set color with: Color(0xFF0000FF)
    ));

    return Scaffold(
        body: SingleChildScrollView(
            child: GestureDetector(
              onTap: (){
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Container(
                height: ScreenUtil().setHeight(1334),
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: Form(
                        key: controller.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                           Image.asset('assets/images/foto-app.jpg',
                             width: ScreenUtil().setWidth(750),
                           ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(43)),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/logo.png',
                                    height:ScreenUtil().setHeight(200),
                                    width:ScreenUtil().setHeight(300),
                                  ),
                                  SizedBox(
                                    height: ScreenUtil().setHeight(22),
                                  ),
                                  _emailPasswordWidget(),
                                  SizedBox(
                                    height: ScreenUtil().setHeight(40),
                                  ),
                                  _loginButton(),
                                  //_facebookButton(),
                                  Padding(
                                    padding: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
                                    child: Obx(()=>
                                      controller.checkBiometrics.value && controller.availableBiometrics.length > 0 && controller.authBio.value ?
                                      IconButton(
                                        icon:Icon(Icons.fingerprint),
                                        onPressed: (){
                                          controller.localAuthenticationFunction();
                                        },
                                        iconSize: ScreenUtil().setHeight(120),
                                      )
                                       : SizedBox(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: SizedBox(),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Align(
                    //   alignment: Alignment.bottomCenter,
                    //   child: _createAccountLabel(),
                    // ),
                    // Positioned(
                    //     top: -ScreenUtil().setHeight(1334) * .15,
                    //     right: -ScreenUtil().setWidth(750) * .4,
                    //     child: BezierContainer(
                    //       pageHeight: ScreenUtil().setHeight(1334), pageWidth: ScreenUtil().setWidth(750),))
                  ],
                ),
              ),
            )
        )
    );
  }
}
  