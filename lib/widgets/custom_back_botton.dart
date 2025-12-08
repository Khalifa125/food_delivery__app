import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/custom_secondary_botton.dart';

class CustomBackBotton extends StatelessWidget {
  final double height;
  final double width;
  final VoidCallback onTap;

  const CustomBackBotton({
    super.key,
    required this.height,
    required this.width,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomSecondaryBotton(
      height: height,
      width: width,
      onTap: onTap,
      iconData: Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
    );
  }
}
