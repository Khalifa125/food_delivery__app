import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';

class FavoriteItem extends StatelessWidget {
  final FoodItem favoriteItem;
  final VoidCallback onUnfavorite;
  final VoidCallback? onConfigure;

  const FavoriteItem({
    super.key,
    required this.favoriteItem,
    required this.onUnfavorite,
    this.onConfigure,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                favoriteItem.imageUrl,
                height: 70,
                width: 100,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    favoriteItem.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$ ${favoriteItem.price.toStringAsFixed(1)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepOrange,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // IconButton(
                //   onPressed: onUnfavorite,
                //   icon: const Icon(
                //     Icons.favorite,
                //     color: Colors.deepOrange,
                //     size: 30,
                //   ),
                // ),
                // if (onConfigure != null) ...[
                //   const SizedBox(width: 8),
                //   IconButton(
                //     onPressed: onConfigure,
                //     icon: const Icon(
                //       Icons.edit,
                //       color: Colors.deepOrange,
                //       size: 30,
                //     ),
                //   ),
              ],
              // ],
            ),
          ],
        ),
      ),
    );
  }
}
