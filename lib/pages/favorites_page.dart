import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
// ignore: unused_import
import 'package:food_delivery/pages/food_details_page.dart';
import 'package:food_delivery/ui_models/food_details_args.dart';
import 'package:food_delivery/widgets/adaptive_fav_botton.dart';

class ColorBox extends StatelessWidget {
  final Color color;

  const ColorBox({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(width: 50, height: 50, color: color);
  }
}

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  Widget buildLandscapefavbotton(List<FoodItem> favoriteFood, int index) {
    return AdaptiveFavButton(
      title: 'Favorited',
      onPressed: () {
        final targetedItem = favoriteFood[index];
        int targetedIndex = food.indexOf(targetedItem);
        setState(() {
          food[targetedIndex] = food[targetedIndex].copyWith(isFavorite: false);
          favoriteFood.remove(targetedItem);
        });
      },
    );
  }

  Widget buildPortraitFavButton(
    List<FoodItem> favoriteFood,
    int index,
    Size size,
  ) {
    return IconButton(
      onPressed: () {
        final targetedItem = favoriteFood[index];
        int targetedIndex = food.indexOf(targetedItem);
        setState(() {
          food[targetedIndex] = food[targetedIndex].copyWith(isFavorite: false);
          favoriteFood.remove(targetedItem);
        });
      },
      icon: Icon(
        Icons.favorite,
        color: Theme.of(context).primaryColor,
        size: size.height * 0.035,
      ),
    );
  }

  Widget emptyFavState(bool isLandscape, Size size) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/empty_state.png',
            fit: BoxFit.cover,
            height: isLandscape ? size.height * 0.4 : size.height * 0.3,
          ),
          Text(
            'No Favorites Items Found!',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }

  Widget adaptiveFavButton(BuildContext context, VoidCallback onPressed) {
    final size = MediaQuery.of(context).size;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    if (Platform.isIOS) {
      return CupertinoButton(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        color: Colors.transparent,
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(CupertinoIcons.heart_fill, color: Colors.orange, size: 22),
            SizedBox(width: 6),
            Text(
              'Favorited',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    } else {
      return TextButton.icon(
        icon: Icon(
          Icons.favorite,
          color: Theme.of(context).primaryColor,
          size: isLandscape ? size.height * 0.08 : size.height * 0.035,
        ),
        onPressed: onPressed,
        label: Text(
          'Favorited',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).primaryColor,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final favoriteFood = food.where((item) => item.isFavorite == true).toList();

    if (favoriteFood.isEmpty) {
      return emptyFavState(isLandscape, size);
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: favoriteFood.length,
        itemBuilder: (context, index) {
          final targetedItem = favoriteFood[index];
          return InkWell(
            onTap: () {
              int targetedIndex = food.indexOf(favoriteFood[index]);
              Navigator.of(context)
                  .pushNamed(
                    arguments: FoodDetailsArgs(foodIndex: targetedIndex),
                    FoodDetailsPage.routeName,
                  )
                  .then((value) {
                    setState(() {});
                    debugPrint('the value Returned in favorites: $value');
                  });
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            targetedItem.imageUrl,
                            width: isLandscape
                                ? size.width * 0.15
                                : size.width * 0.25,
                            height: isLandscape
                                ? size.height * 0.19
                                : size.height * 0.09,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(width: 12.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                targetedItem.name,
                                style: Theme.of(context).textTheme.titleLarge!,
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                '\$${targetedItem.price}',
                                style: Theme.of(context).textTheme.titleMedium!
                                    .copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        if (!isLandscape)
                          buildPortraitFavButton(favoriteFood, index, size),
                        if (isLandscape)
                          buildLandscapefavbotton(favoriteFood, index),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
