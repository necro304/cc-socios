import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:get/route_manager.dart';

class BackButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.back();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black54, size: ScreenUtil().setWidth(50),),
            ),
            Text('Atrás',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(30),
                    color: Colors.black54,
                    fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
