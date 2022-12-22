import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.person_pin_rounded, size: 90),
        const SizedBox(height: 12),
        Text('Nanang', style: Get.textTheme.headline4),
      ],
    );
  }
}
