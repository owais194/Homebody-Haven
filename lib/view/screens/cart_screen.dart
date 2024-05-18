import 'package:decor_home/controller/home_decor_controller.dart';
import 'package:decor_home/helper/widgets/bottomnav_bar.dart';
import 'package:decor_home/helper/widgets/cardlist_view.dart';
import 'package:decor_home/helper/widgets/counter.dart';
import 'package:decor_home/helper/widgets/empty_widget.dart';
import 'package:decor_home/src/core/decorapp_colors.dart';
import 'package:decor_home/src/core/decorapp_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  final HomeDecoreController controller = Get.put(HomeDecoreController());

  CartScreen({super.key});

  PreferredSizeWidget _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text("Cart", style: h2Style),
      actions: [
        IconButton(
          splashRadius: 20.0,
          onPressed: controller.clearCart,
          icon: const Icon(Icons.delete, color: AppColor.lightBlack),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 244, 245),
      appBar: _appBar(),
      bottomNavigationBar: Obx(
        () {
          return BottomBar(
            priceLabel: "Total price",
            priceValue: "\$${controller.totalPrice.value.toStringAsFixed(2)}",
            buttonLabel: "Checkout",
            onTap: controller.totalPrice > 0 ? () {} : null,
          );
        },
      ),
      body: GetBuilder(
        builder: (HomeDecoreController controller) {
          return controller.cartFurniture.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(15),
                  child: CartListView(
                    furnitureItems: controller.cartFurniture,
                    counterButton: (furniture) {
                      return CounterButton(
                        orientation: Axis.vertical,
                        onIncrementSelected: () =>
                            controller.increaseItem(furniture),
                        onDecrementSelected: () =>
                            controller.decreaseItem(furniture),
                        label: furniture.quantity,
                      );
                    },
                  ),
                )
              : const EmptyWidget(title: "Empty");
        },
      ),
    );
  }
}
