import 'package:flutter/material.dart';
import 'package:untitled/core/app_colors.dart';

class SecurityFooter extends StatelessWidget {
  const SecurityFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shield_outlined, color: AppColors.textMuted, size: 13),
            const SizedBox(width: 5),
            Text(
              '256-bit SSL  ·  PCI DSS Compliant',
              style: TextStyle(
                color: AppColors.textMuted.withOpacity(0.8),
                fontSize: 11,
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          'Powered by SSLCommerz',
          style: TextStyle(color: AppColors.textMuted.withOpacity(0.5), fontSize: 10),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
