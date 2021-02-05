import 'package:css_socios/app/data/models/benefit_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart'; 
import 'package:css_socios/app/modules/benefit/controllers/benefit_controller.dart';

class BenefitView extends GetView<BenefitController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Beneficios', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),),
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black54),
      ),
      body: Obx(()=>
          controller.errorMessage.value.length == 0 ?
          ListView.builder(
            itemCount: controller.beneficios.length,
            itemExtent: 80,
            itemBuilder: (BuildContext context, int index) {
              final item = controller.beneficios[index];
              return _itemBeneficio(item, index, context);
            },

          ) :Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(50)),
              child: Text(controller.errorMessage.value ,style: TextStyle(color: Colors.black54,fontSize: ScreenUtil().setSp(50) ,), textAlign: TextAlign.center,),
            ),
          ),
      ),
    );
  }

  Widget _itemBeneficio(Beneficio item, int index, BuildContext context) {
    return ListTile(
      title: Text(item.descripcionCorta, style: TextStyle(fontSize: ScreenUtil().setSp(30), color: Colors.black54),),
      leading: FadeInImage(
        image: NetworkImage(item.imagen),
        placeholder: AssetImage('assets/images/loading.gif'),
        height: ScreenUtil().setWidth(150),
        width: ScreenUtil().setWidth(150),
      ),
      enabled: true,
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.black54,),
    );
  }
}
  