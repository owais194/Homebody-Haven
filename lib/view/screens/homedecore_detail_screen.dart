import 'package:decor_home/controller/home_decor_controller.dart';
import 'package:decor_home/helper/widgets/color_picker.dart';
import 'package:decor_home/helper/widgets/counter.dart';
import 'package:decor_home/helper/widgets/star_rating_bar.dart';
import 'package:decor_home/models/home_decor.dart';
import 'package:decor_home/src/core/decorapp_colors.dart';
import 'package:decor_home/src/core/decorapp_extension.dart';
import 'package:decor_home/src/core/decorapp_text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeDecoreDetailScreen extends StatelessWidget {
  final HomeDecoreController controller = Get.put(HomeDecoreController());
  final HomeDecore furniture;
  HomeDecoreDetailScreen({
    super.key,
    required this.furniture,
  });

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color.fromARGB(255, 242, 244, 245),
      actions: [
        GetBuilder(
          builder: (HomeDecoreController controller) {
            return IconButton(
              splashRadius: 18.0,
              onPressed: () => controller.isFavoriteFurniture(furniture),
              icon: furniture.isFavorite
                  ? const Icon(Icons.bookmark, color: Colors.black)
                  : const Icon(Icons.bookmark_border, color: Colors.black),
            );
          },
        )
      ],
      leading: IconButton(
        icon: const Icon(FontAwesomeIcons.arrowLeft, color: Colors.black),
        onPressed: () {
          controller.currentPageViewItemIndicator.value = 0;
          Navigator.pop(context);
        },
      ),
      title: Text(furniture.title, style: h2Style),
    );
  }

  Widget bottomBar() {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FittedBox(
                child: Text(
                  'Price',
                  style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              FittedBox(child: Text("\$${furniture.price}", style: h2Style))
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.lightOrange,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              Get.snackbar('Added to cart', "your item has been added to cart",
                  backgroundColor: Colors.purple.withOpacity(.1));
              controller.addToCart(furniture);
            },
            child: const Text(
              "Add to cart",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          )
        ],
      ),
    ).fadeAnimation(1.3);
  }

  Widget furnitureImageSlider(double height) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
      height: height * 0.5,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            onPageChanged: controller.switchBetweenPageViewItems,
            itemCount: furniture.images.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Hero(
                    tag: index,
                    child: Image.asset(
                      furniture.images[index],
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 20,
            child: Obx(
              () {
                return AnimatedSmoothIndicator(
                  effect: const WormEffect(
                    dotColor: Colors.white38,
                    activeDotColor: Colors.white,
                  ),
                  activeIndex: controller.currentPageViewItemIndicator.value,
                  count: furniture.images.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        controller.currentPageViewItemIndicator.value = 0;
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 242, 244, 245),
        bottomNavigationBar: bottomBar(),
        appBar: _appBar(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                furnitureImageSlider(height),
                Center(
                  child: StarRatingBar(
                    score: furniture.score,
                    itemSize: 25,
                  ).fadeAnimation(0.4),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: const Text(
                    "Lorem Ispum",
                    style: h2Style,
                    textAlign: TextAlign.end,
                  ).fadeAnimation(0.6),
                ),
                Text(
                  furniture.description,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.black45),
                ).fadeAnimation(0.8),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Text(
                      "Color :",
                      style: h2Style,
                      textAlign: TextAlign.end,
                    ),
                    Expanded(child: ColorPicker(furniture.colors)),
                    Expanded(child: GetBuilder(
                      builder: (HomeDecoreController controller) {
                        return CounterButton(
                          label: furniture.quantity,
                          onIncrementSelected: () =>
                              controller.increaseItem(furniture),
                          onDecrementSelected: () =>
                              controller.decreaseItem(furniture),
                        );
                      },
                    ))
                  ],
                ).fadeAnimation(1.0)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
