import 'package:flutter/material.dart';
import 'package:project/src/core/presentation/widgets/buttons/app_ink_button.dart';
import 'package:project/src/core/theme/resources.dart';

class AppConfirmDialog extends StatelessWidget {
  const AppConfirmDialog({
    required this.title,
    required this.message,
    required this.actions,
    this.insetPadding = const EdgeInsets.symmetric(horizontal: 16),
    this.padding = const EdgeInsets.fromLTRB(24, 25, 24, 24),
    this.backgroundColor = AppColors.bgPrimary,
    this.borderRadius = const BorderRadius.all(Radius.circular(24)),
    this.border,
    this.titleStyle,
    this.messageStyle,
    this.messageSpacing = 8,
    this.actionsSpacing = 24,
    this.actionSpacing = 12,
    super.key,
  });

  final String title;
  final String message;
  final List<AppConfirmDialogAction> actions;
  final EdgeInsets insetPadding;
  final EdgeInsets padding;
  final Color backgroundColor;
  final BorderRadius borderRadius;
  final BoxBorder? border;
  final TextStyle? titleStyle;
  final TextStyle? messageStyle;
  final double messageSpacing;
  final double actionsSpacing;
  final double actionSpacing;

  static Future<T?> show<T>({
    required BuildContext context,
    required Widget dialog,
    Color barrierColor = AppColors.barrierColor,
  }) {
    return showDialog<T>(
      context: context,
      barrierColor: barrierColor,
      builder: (_) => dialog,
    );
  }

  @override
  Widget build(BuildContext context) {
    assert(actions.isNotEmpty, 'AppConfirmDialog requires at least one action');

    final resolvedTitleStyle =
        titleStyle ??
        AppTextStyles.body16Semibold.copyWith(
          color: AppColors.textPrimary,
          height: 20 / 16,
        );
    final resolvedMessageStyle =
        messageStyle ??
        AppTextStyles.body14Regular.copyWith(
          color: AppColors.textSecondary,
          height: 18 / 14,
        );

    return Dialog(
      elevation: 0,
      insetPadding: insetPadding,
      backgroundColor: Colors.transparent,
      child: Container(
        width: double.infinity,
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
          border: border,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, textAlign: TextAlign.center, style: resolvedTitleStyle),
            SizedBox(height: messageSpacing),
            Text(
              message,
              textAlign: TextAlign.center,
              style: resolvedMessageStyle,
            ),
            SizedBox(height: actionsSpacing),
            Row(
              children: [
                for (var i = 0; i < actions.length; i++) ...[
                  Expanded(
                    child: _AppConfirmDialogActionButton(action: actions[i]),
                  ),
                  if (i != actions.length - 1) SizedBox(width: actionSpacing),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AppConfirmDialogAction {
  const AppConfirmDialogAction({
    required this.label,
    required this.onPressed,
    this.widgetKey,
    this.fillColor = Colors.transparent,
    this.textColor = AppColors.textPrimary,
    this.borderColor,
    this.borderWidth = 1,
    this.radius = 24,
    this.height = 48,
    this.shape,
    this.textStyle,
  });

  final String label;
  final VoidCallback onPressed;
  final Key? widgetKey;
  final Color fillColor;
  final Color textColor;
  final Color? borderColor;
  final double borderWidth;
  final double radius;
  final double height;
  final ShapeBorder? shape;
  final TextStyle? textStyle;
}

class _AppConfirmDialogActionButton extends StatelessWidget {
  const _AppConfirmDialogActionButton({required this.action});

  final AppConfirmDialogAction action;

  @override
  Widget build(BuildContext context) {
    final borderSide = action.borderColor == null
        ? BorderSide.none
        : BorderSide(color: action.borderColor!, width: action.borderWidth);
    final shape =
        action.shape ??
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(action.radius),
          side: borderSide,
        );
    final style = (action.textStyle ?? AppTextStyles.body14Semibold).copyWith(
      color: action.textColor,
    );

    return AppInkButton(
      key: action.widgetKey,
      height: action.height,
      color: action.fillColor,
      shape: shape,
      onTap: action.onPressed,
      child: Text(
        action.label,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: style,
      ),
    );
  }
}
