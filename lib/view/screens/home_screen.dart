import 'package:decor_home/controller/home_decor_controller.dart';
import 'package:decor_home/src/core/decorapp_colors.dart';
import 'package:decor_home/src/core/decoreapp_data.dart';
import 'package:decor_home/view/screens/cart_screen.dart';
import 'package:decor_home/view/screens/favourite_screen.dart';
import 'package:decor_home/view/screens/home_decor_list.dart';
import 'package:decor_home/view/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  static const String route = 'home_screen';
  final HomeDecoreController controller = Get.put(HomeDecoreController());
  HomeScreen({super.key});
  final List<Widget> screens = [
    const HomeDecoreList(),
    CartScreen(),
    FavouriteScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      bottomNavigationBar: Obx(
        () {
          return BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            currentIndex: controller.currentBottomNavItemIndex.value,
            showUnselectedLabels: true,
            onTap: controller.switchBetweenBottomNavigationItems,
            fixedColor: AppColor.lightBlack,
            items: AppData.bottomNavigationItems
                .map(
                  (element) => BottomNavigationBarItem(
                      icon: element.icon, label: element.label),
                )
                .toList(),
          );
        },
      ),
      body: Obx(() => screens[controller.currentBottomNavItemIndex.value]),
    );
  }
}
