import 'package:decor_home/helper/widgets/furniture_list.dart';
import 'package:decor_home/models/home_decor.dart';
import 'package:decor_home/src/core/decorapp_text_style.dart';
import 'package:decor_home/src/core/decoreapp_data.dart';
import 'package:decor_home/view/screens/homedecore_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeDecoreList extends StatelessWidget {
  const HomeDecoreList({super.key});

  PreferredSize _appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(120),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello User", style: h2Style),
                  Text("Buy Your favorite decor", style: h3Style),
                ],
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(FontAwesomeIcons.user))
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          suffixIcon: const Icon(Icons.menu, color: Colors.grey),
          contentPadding: const EdgeInsets.all(20),
          border: textFieldStyle,
          focusedBorder: textFieldStyle,
        ),
      ),
    );
  }

  Future<void> _checkAndShowSnackbar() async {
    final prefs = await SharedPreferences.getInstance();
    final isFirstTime = prefs.getBool('isFirstTime') ?? true;

    if (isFirstTime) {
      showSnackbar();
      await prefs.setBool('isFirstTime', false);
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<Widget?> navigate(HomeDecore furniture) {
      return Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(seconds: 1),
          pageBuilder: (_, __, ___) =>
              HomeDecoreDetailScreen(furniture: furniture),
        ),
      );
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAndShowSnackbar();
    });

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 244, 245),
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            _searchBar(),
            FurnitureListView(
              furnitureList: AppData.furnitureList,
              onTap: navigate,
            ),
            const Text("Popular", style: h2Style),
            FurnitureListView(
              furnitureList: AppData.furnitureList,
              isHorizontal: false,
              onTap: navigate,
            ),
          ],
        ),
      ),
    );
  }
}

// Function to show a snackbar
void showSnackbar() {
  Get.snackbar('Home Decore', 'Welcome to Home Decor App',
      backgroundColor: Colors.teal.withOpacity(.2));
}
