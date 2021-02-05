import 'package:css_socios/app/data/models/benefit_model.dart';
import 'package:css_socios/app/modules/benefit/controllers/category_controller.dart';
import 'package:css_socios/app/routes/app_pages.dart';
import 'package:css_socios/app/shares/widgets/drawer_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart'; 

class CategoryView extends GetView<CategoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerCustomWidget(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black54),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Categorías', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Obx(()=>
        ListView.builder(
          itemCount: controller.categories.length,
          itemExtent: 80,
          itemBuilder: (BuildContext context, int index) { 
            final item = controller.categories[index];
            return _itemCategory(item, index, context);
          },
          
        ),
      ),
    );
  }

  Widget _itemCategory(Categoria item, int index, BuildContext context) {
    return ListTile(
      title: Text(item.nombre, style: TextStyle(fontSize: ScreenUtil().setSp(30), color: Colors.black54),),
      onTap: (){
        Get.toNamed(Routes.BENEFIT, arguments: item.idCategoria);
      },
      leading: FadeInImage(
        image: NetworkImage(item.icono),
        placeholder: AssetImage('assets/images/loading.gif'),
        height: ScreenUtil().setWidth(150),
        width: ScreenUtil().setWidth(150),
      ),
      enabled: true,
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.black54,),
    );
  }
}
  