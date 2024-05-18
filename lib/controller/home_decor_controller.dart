import 'package:decor_home/models/home_decor.dart';
import 'package:decor_home/src/core/decorapp_extension.dart';
import 'package:get/get.dart';

class HomeDecoreController extends GetxController {
  RxInt currentBottomNavItemIndex = 0.obs;
  RxInt currentPageViewItemIndicator = 0.obs;
  RxList<HomeDecore> cartFurniture = <HomeDecore>[].obs;
  RxList<HomeDecore> favoriteFurnitureList = <HomeDecore>[].obs;
  RxDouble totalPrice = 0.0.obs;

  switchBetweenBottomNavigationItems(int currentIndex) {
    currentBottomNavItemIndex.value = currentIndex;
  }

  switchBetweenPageViewItems(int currentIndex) {
    currentPageViewItemIndicator.value = currentIndex;
  }

  isFavoriteFurniture(HomeDecore furniture) {
    furniture.isFavorite = !furniture.isFavorite;
    update();
    if (furniture.isFavorite) {
      favoriteFurnitureList.add(furniture);
    }
    if (!furniture.isFavorite) {
      favoriteFurnitureList.removeWhere((element) => element == furniture);
    }
  }

  void increaseItem(HomeDecore furniture) {
    furniture.quantity++;
    update();
    calculateTotalPrice();
  }

  void decreaseItem(HomeDecore furniture) {
    furniture.quantity = furniture.quantity-- < 1 ? 0 : furniture.quantity--;
    calculateTotalPrice();
    update();
    if (furniture.quantity < 1) {
      cartFurniture.removeWhere((element) => element == furniture);
    }
  }

  addToCart(HomeDecore furniture) {
    if (furniture.quantity > 0) {
      cartFurniture.add(furniture);
      cartFurniture.assignAll(cartFurniture.distinctBy((item) => item));
      calculateTotalPrice();
    }
  }

  calculateTotalPrice() {
    totalPrice.value = 0;
    for (var element in cartFurniture) {
      totalPrice.value += element.quantity * element.price;
    }
  }

  void clearCart() {
    cartFurniture.clear();
    totalPrice.value = 0;
    update();
  }
}
