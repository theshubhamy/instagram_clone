import 'package:flutter/material.dart';

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    const data = "This is Mobile Layout";
    return const Scaffold(body: Center(child: Text(data)));
  }
}
