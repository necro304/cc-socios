import 'package:css_socios/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:get/get.dart';



class DrawerCustomWidget extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.green,
                        Colors.lightGreen
                      ]
                  )
              ),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: ScreenUtil().setHeight(100),
                      backgroundColor: Colors.white,
                      child:Image.asset(
                        'assets/images/logo.png',
                        height: ScreenUtil().setHeight(90),
                      ),
                    ),
                  ],
                ),
              )
          ),
          SizedBox( height: ScreenUtil().setHeight(20)),
          _menuItem(title: 'Tarjeta virtual', icon: Icons.credit_card, route: Routes.VIRTUAL_CARD, ),
          _menuItem(title: 'Beneficios', icon: Icons.monetization_on, route: Routes.BENEFIT_CATEGORY, ),

          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Center(child:
            MaterialButton(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(FontAwesome.power_off, color: Colors.white, size: 60,),
              ),
              color: Colors.red,
              elevation: 0,
              shape: CircleBorder(),
              onPressed:() async {
                await Get.offAllNamed(Routes.LOGIN);
              },
            ),
            ),
          )
        ],
      ),
    );
  }
  Widget _menuItem( {String title, String route, IconData icon}){
    return  Card(
      elevation: 0,
      child: ListTile(
        leading: Icon(icon),
        title: Text(title, style: TextStyle(color: Colors.black54, fontSize: ScreenUtil().setSp(30)),),
        trailing: Icon(Icons.arrow_forward_ios),
        enabled: true,
        onTap: (){
          if(Get.currentRoute != route)
            Get.offAllNamed(route);
        },
      ),
    );
  }
}
