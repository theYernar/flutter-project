import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/src/core/presentation/widgets/buttons/app_back_button.dart';
import 'package:flutter_project/src/core/theme/resources.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool showBackButton;
  final Widget? trailing;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 10),
        child: Row(
          children: [
            if (showBackButton) ...[
              AppBackButton(onTap: () => context.router.maybePop()),
              const Gap(16),
            ],
            Text(
              title,
              style: AppTextStyles.fs20w900.copyWith(
                color: AppColors.white,
              ),
            ),
            if (trailing != null) ...[const Spacer(), trailing!],
          ],
        ),
      ),
    );
  }
}
