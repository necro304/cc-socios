import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:css_socios/app/modules/virtualCard/controllers/virtual_card_controller.dart';
import 'package:css_socios/app/shares/widgets/drawer_custom.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

extension IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }
}

class VirtualCardView extends GetView<VirtualCardController> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.keyScaffold,
      drawer: DrawerCustomWidget(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black54),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Tarjeta virtual', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            SizedBox(height:ScreenUtil().setHeight(20) ,),
            SizedBox(
              child: Obx(()=>
                 Container(
                  child: !controller.busy.value && controller.card.value != null && controller.card.value.respuestaCode != null ?
                  FlipCard(
                      direction: FlipDirection.HORIZONTAL, // default
                      front: Stack(
                        children: [
                          Container(
                            child: Image.asset('assets/images/card_front.png',
                              fit: BoxFit.contain,
                              width: ScreenUtil().setWidth(650),),
                          ),
                          Positioned(
                            right: 10,
                            left: 40,
                            top: 45,
                            bottom: 5,
                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: controller.separateText(controller.card.value.numeroTarjeta).mapIndexed((number, i) {
                                    return Row(
                                      children: [
                                        Text(number, style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(46)),),
                                        SizedBox(width: controller.separateText(controller.card.value.numeroTarjeta).length > (i+1) ? 10 : 0,)
                                      ],
                                    );
                                  }).toList(),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(controller.name.value, style:  TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(37)))
                                ),
                                Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text("VTO ${controller.card.value.fechaVencimiento}", style:  TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(30)))
                                ),
                              ],
                            )
                          )
                        ],
                      ),
                      back: Container(
                        child: Image.asset('assets/images/card_back.png',
                          fit: BoxFit.contain,
                          width: ScreenUtil().setWidth(650),),
                      ),
                    )
                      : Center(child: Text(controller.errorMessage.value, style: TextStyle(color: Colors.black54, ),),),
                ),
              ),
            ),
            SizedBox(height:ScreenUtil().setHeight(20) ,),
            ArgonButton(
                height: ScreenUtil().setHeight(70),
                roundLoadingShape: true,
                width: ScreenUtil().setWidth(650),
                onTap: (startLoading, stopLoading, btnState) async {
                  if (btnState == ButtonState.Idle) {
                    await startLoading();
                    await controller.getOtp();
                    await stopLoading();
                  } else {
                    await stopLoading();
                  }
                },
                child: Text(
                  "Generar QR",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                loader: Container(
                  padding: EdgeInsets.all(10),
                  child: SpinKitRipple(
                    color: Colors.white,
                    // size: loaderWidth ,
                  ),
                ),
                borderRadius: 5.0,
                color: Colors.blue,
              ),
            SizedBox(height: ScreenUtil().setHeight(20) ,),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 600),
              child: Obx(() => controller.qrData.value.length > 0 ?
                  Card(
                    elevation: 4,
                    child: QrImage(
                    data: controller.qrData.value,
                    version: QrVersions.auto,
                    foregroundColor: Color(0xff000c36),
                    size: ScreenUtil().setWidth(650),
                    gapless: false,

                ),
                  ) : SizedBox(),
              ),
            )


            ],
        ),
      ),
    );
  }
}
  