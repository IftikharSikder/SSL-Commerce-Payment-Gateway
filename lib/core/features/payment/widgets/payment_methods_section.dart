import 'package:flutter/material.dart';
import 'package:untitled/core/app_colors.dart';

class PaymentMethodsSection extends StatelessWidget {
  const PaymentMethodsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ACCEPTED METHODS',
          style: TextStyle(
            color: AppColors.textMuted,
            fontSize: 10.5,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.4,
          ),
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _PaymentMethodTile(label: 'Visa', icon: Icons.credit_card_rounded),
            ),
            SizedBox(width: 10),
            Expanded(
              child: _PaymentMethodTile(label: 'Mastercard', icon: Icons.credit_card_rounded),
            ),
            SizedBox(width: 10),
            Expanded(
              child: _PaymentMethodTile(label: 'bKash', icon: Icons.phone_android_rounded),
            ),
          ],
        ),
      ],
    );
  }
}

class _PaymentMethodTile extends StatelessWidget {
  final String label;
  final IconData icon;

  const _PaymentMethodTile({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderLight, width: 1),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1A1714).withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.goldLight, size: 22),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
