import 'package:flutter/material.dart';
import 'package:flutter_project/src/core/presentation/widgets/checkboxes/app_check.dart';
import 'package:flutter_project/src/core/theme/resources.dart';

/// Description of a single row inside [AppCheckListCard].
class AppCheckListItem<T> {
  const AppCheckListItem({required this.value, required this.label});

  final T value;
  final String label;
}

/// Card-style multi-select list with hairline dividers between rows.
///
/// Each row pairs a label on the left with a square [AppCheck] on the right.
/// The whole card uses [AppColors.surface1] background, matching the
/// "Изменение в деталях" block in the design.
class AppCheckListCard<T> extends StatelessWidget {
  const AppCheckListCard({
    required this.items,
    required this.selected,
    required this.onToggle,
    super.key,
  });

  final List<AppCheckListItem<T>> items;
  final Set<T> selected;
  final ValueChanged<T> onToggle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface1,
        borderRadius: BorderRadius.circular(AppRadius.input),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          for (var i = 0; i < items.length; i++) ...[
            if (i > 0)
              const Divider(height: 1, thickness: 1, color: AppColors.surface2),
            _Row(
              item: items[i],
              isSelected: selected.contains(items[i].value),
              onToggle: () => onToggle(items[i].value),
            ),
          ],
        ],
      ),
    );
  }
}

class _Row<T> extends StatelessWidget {
  const _Row({
    required this.item,
    required this.isSelected,
    required this.onToggle,
  });

  final AppCheckListItem<T> item;
  final bool isSelected;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onToggle,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Row(
          children: [
            Expanded(
              child: Text(
                item.label,
                style: AppTextStyles.body16Medium.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            AppCheck(value: isSelected, onChanged: (_) => onToggle()),
          ],
        ),
      ),
    );
  }
}
