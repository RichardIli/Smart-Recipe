import 'package:flutter/material.dart';

class QuickActionsCard extends StatelessWidget {
  const QuickActionsCard({
    super.key,
    required this.lbl,
    required this.icon,
    required this.lblColor,
    required this.bgColor,
    this.onTap,
  });

  final String lbl;
  final IconData icon;
  final VoidCallback? onTap;
  final Color lblColor;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: bgColor,
        child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 10,
            children: [
              Icon(icon, color: lblColor, size: 50),
              Text(
                lbl,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(color: lblColor),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
