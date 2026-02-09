import 'package:flutter/material.dart';

class InfoChip extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final VoidCallback? onTap;

  const InfoChip({
    super.key,
    required this.label,
    this.icon,
    this.backgroundColor,
    this.textStyle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      onPressed: onTap ?? () {},
      backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.surface,
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[Icon(icon, size: 16), const SizedBox(width: 6)],
          Text(label, style: textStyle ?? Theme.of(context).textTheme.bodyMedium),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}
