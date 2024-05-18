import 'package:decor_home/models/bottom_item_nav.dart';
import 'package:decor_home/models/home_decor.dart';
import 'package:decor_home/models/home_decor_colors.dart';
import 'package:decor_home/src/core/decorapp_assets.dart';
import 'package:flutter/material.dart';

class AppData {
  const AppData._();

  static const dummyText =
      """Lorem Ipsum is simply dummy text of the printing and typesetting
       industry. Lorem Ipsum has been the industry's standard dummy text ever
        since the 1500s, when an unknown printer took a galley of type and
         scrambled it to make a type specimen book. It has survived not only 
         five centuries, but also the leap into electronic typesetting,
          remaining essentially unchanged. It was popularised in the 1960s with
           the release of Letraset sheets containing Lorem Ipsum passages,
            and more recently with desktop publishing software like Aldus
             PageMaker including versions of Lorem Ipsum.""";

  static List<HomeDecore> furnitureList = [
    HomeDecore(
      quantity: 1,
      isFavorite: false,
      title: 'Sofa',
      description: dummyText,
      price: 469.99,
      score: 3.5,
      images: [
        AppAsset.homeDecorSofa1,
        AppAsset.homeDecorSofa2,
        AppAsset.homeDecorSofa3,
        AppAsset.homeDecorSofa4,
        AppAsset.homeDecorSofa5,
        AppAsset.homeDecorSofa6,
        AppAsset.homeDecorSofa7,
      ],
      colors: <HomeDecoreColor>[
        HomeDecoreColor(color: const Color(0xFF616161), isSelected: true),
        HomeDecoreColor(color: const Color(0xFF424242)),
      ],
    ),
    HomeDecore(
      isFavorite: false,
      quantity: 1,
      title: 'Cofee Table',
      description: dummyText,
      price: 299.99,
      score: 4.5,
      images: [
        AppAsset.homeDecorCofeeTable1,
        AppAsset.homeDecorCofeeTable2,
        AppAsset.homeDecorCofeeTable3,
        AppAsset.homeDecorCofeeTable4,
        AppAsset.homeDecorCofeeTable5,
      ],
      colors: <HomeDecoreColor>[
        HomeDecoreColor(color: const Color(0xFF5d4037), isSelected: true),
        HomeDecoreColor(color: const Color(0xFF424242)),
      ],
    ),
    HomeDecore(
      quantity: 1,
      isFavorite: false,
      title: 'Office Table',
      description: dummyText,
      price: 659.99,
      score: 3.0,
      images: [
        AppAsset.homeDecorOfficeTable1,
        AppAsset.homeDecorOfficeTable2,
        AppAsset.homeDecorOfficeTable3,
        AppAsset.homeDecorOfficeTable4,
        AppAsset.homeDecorOfficeTable5,
        AppAsset.homeDecorOfficeTable6,
      ],
      colors: <HomeDecoreColor>[
        HomeDecoreColor(color: const Color(0xFF616161), isSelected: true),
        HomeDecoreColor(color: const Color(0xFF212121)),
      ],
    ),
    HomeDecore(
      quantity: 1,
      isFavorite: false,
      title: 'Arm Chair',
      description: dummyText,
      price: 349.99,
      score: 2.5,
      images: [
        AppAsset.homeDecorArmChair1,
        AppAsset.homeDecorArmChair2,
        AppAsset.homeDecorArmChair3,
        AppAsset.homeDecorArmChair4,
        AppAsset.homeDecorArmChair5,
        AppAsset.homeDecorArmChair6,
      ],
      colors: <HomeDecoreColor>[
        HomeDecoreColor(color: const Color(0xFF455a64), isSelected: true),
        HomeDecoreColor(color: const Color(0xFF263238)),
      ],
    ),
    HomeDecore(
      quantity: 1,
      isFavorite: false,
      title: 'Dining Table',
      description: dummyText,
      price: 499.99,
      score: 2.8,
      images: [
        AppAsset.homeDecorDiningTable1,
        AppAsset.homeDecorDiningTable2,
        AppAsset.homeDecorDiningTable3,
        AppAsset.homeDecorDiningTable4,
        AppAsset.homeDecorDiningTable5,
      ],
      colors: <HomeDecoreColor>[
        HomeDecoreColor(color: const Color(0xFF5d4037), isSelected: true),
        HomeDecoreColor(color: const Color(0xFF455a64)),
      ],
    ),
  ];

  static List<BottomNavigationItem> bottomNavigationItems = [
    const BottomNavigationItem(Icon(Icons.home), 'Home'),
    const BottomNavigationItem(
        Icon(Icons.add_shopping_cart_rounded), 'Shopping cart'),
    const BottomNavigationItem(Icon(Icons.bookmark), 'Favorite'),
    const BottomNavigationItem(Icon(Icons.person), 'Profile')
  ];
}
