import 'package:flutter/material.dart';
import 'package:flutter_project/src/core/presentation/widgets/buttons/bouncy_button.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // return BouncyButton(onTap: onTap, child: Assets.icons.back.svg());
    return BouncyButton(onTap: onTap, child: const Icon(Icons.arrow_back_ios_new_rounded));
  }
}
