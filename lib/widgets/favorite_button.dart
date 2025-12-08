import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/widgets/custom_secondary_botton.dart';

class FavoriteButton extends StatefulWidget {
  final int foodIndex;
  final double height;
  final double width;

  FavoriteButton({
    super.key,
    required this.foodIndex,
    required this.width,
    required this.height,
  }) {
    debugPrint('constructor FavoriteButton called!');
  }

  @override
  // ignore: no_logic_in_create_state
  State<FavoriteButton> createState() {
    debugPrint('CreateState FavoriteButton called! - dispose');
    return _FavoriteButtonState();
  }
}

class _FavoriteButtonState extends State<FavoriteButton> {
  _FavoriteButtonState() {
    debugPrint('constructor FavoriteButton State called!- dispose');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint('didChangeDependencies FavoriteButton State called!');
  }

  @override
  void didUpdateWidget(covariant FavoriteButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint('didUpdateWidget FavoriteButton State called!');
  }

  @override
  Widget build(BuildContext context) {
    return CustomSecondaryBotton(
      height: widget.height,
      width: widget.width,
      onTap: () => setState(() {
        food[widget.foodIndex] = food[widget.foodIndex].copyWith(
          isFavorite: !food[widget.foodIndex].isFavorite,
        );
      }),
      iconData: food[widget.foodIndex].isFavorite
          ? Icons.favorite
          : Icons.favorite_border,
    );
  }
}
