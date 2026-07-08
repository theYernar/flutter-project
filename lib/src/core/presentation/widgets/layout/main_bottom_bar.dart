import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/src/core/presentation/widgets/buttons/bouncy_button.dart';
import 'package:project/src/core/theme/resources.dart';

class MainBottomBar extends StatelessWidget {
  const MainBottomBar({required this.tabsRouter, super.key});

  final TabsRouter tabsRouter;

  @override
  Widget build(BuildContext context) {
    final activeIndex = tabsRouter.activeIndex;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).bottomSheetTheme.backgroundColor ?? Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.viewPaddingOf(context).bottom + 12,
        top: 10,
        left: 20,
        right: 20,
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _TabItem(
              icon: activeIndex == 0 ? Icons.home : Icons.home_outlined,
              label: 'Главная',
              isActive: activeIndex == 0,
              onTap: () => tabsRouter.setActiveIndex(0),
            ),
            _TabItem(
              icon: activeIndex == 1 ? Icons.person : Icons.person_outline,
              label: 'Профиль',
              isActive: activeIndex == 1,
              onTap: () => tabsRouter.setActiveIndex(1),
            ),
          ],
        ),
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  const _TabItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return BouncyButton(
      onTap: () {
        HapticFeedback.mediumImpact();
        onTap();
      },
      child: SizedBox(
        width: 80,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 26,
              color: isActive ? AppColors.mainColor : AppColors.grey53,
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: AppTextStyles.fs12w700.copyWith(
                color: isActive ? AppColors.mainColor : AppColors.grey53,
                height: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
