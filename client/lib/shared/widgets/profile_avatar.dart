import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String? imageUrl;
  final String? initials;
  final double size;
  final VoidCallback? onTap;
  final Color? borderColor;

  const ProfileAvatar({
    super.key,
    this.imageUrl,
    this.initials,
    this.size = 56,
    this.onTap,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final avatar = CircleAvatar(
      radius: size / 2,
      backgroundColor: Theme.of(context).colorScheme.surface,
      backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
      child: imageUrl == null
          ? Text(
              initials ?? '',
              style: Theme.of(context).textTheme.titleMedium,
            )
          : null,
    );

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: borderColor ?? Colors.transparent, width: 2),
        ),
        child: avatar,
      ),
    );
  }
}
