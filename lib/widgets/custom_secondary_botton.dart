import 'package:flutter/material.dart';
class CustomSecondaryBotton extends StatelessWidget {
  final double height;
  final double width;
  final VoidCallback onTap;
  final IconData iconData;
  const CustomSecondaryBotton({super.key, required this.height, required this.width, required this.onTap, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: width,
      width: height,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: InkWell(
        onTap: onTap,
        child: Icon(
         iconData,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}