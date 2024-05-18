import 'package:decor_home/controller/home_decor_controller.dart';
import 'package:decor_home/helper/widgets/empty_widget.dart';
import 'package:decor_home/helper/widgets/furniture_list.dart';
import 'package:decor_home/src/core/decorapp_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class FavouriteScreen extends StatelessWidget {
  final HomeDecoreController controller = Get.put(HomeDecoreController());
  FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 244, 245),
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Favorites", style: h2Style)),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              controller.favoriteFurnitureList.isNotEmpty
                  ? FurnitureListView(
                      isHorizontal: false,
                      furnitureList: controller.favoriteFurnitureList,
                    )
                  : const EmptyWidget(
                      type: EmptyWidgetType.favorite,
                      title: "Empty",
                    )
            ],
          ),
        ),
      ),
    );
  }
}
