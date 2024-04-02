import 'package:flutter/material.dart';
import 'package:services/core/constant/imageassets.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImageAssets.onBoardingImageglusLogo,
      height: 100,
    );
  }
}
