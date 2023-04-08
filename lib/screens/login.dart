import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usocial/utils/colors.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Container(),
                    ),
                    SvgPicture.asset(
                      "assets/images/instagram.svg",
                      colorFilter:
                          const ColorFilter.mode(primaryColor, BlendMode.srcIn),
                      height: 64,
                    ),
                    const SizedBox(
                      height: 64,
                    )
                  ],
                ))));
  }
}
