import 'package:flutter/material.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:untitled/core/app_colors.dart';
import 'package:untitled/core/features/payment/widgets/amount_breakdown_card.dart';
import 'package:untitled/core/features/payment/widgets/order_summary_card.dart';
import 'package:untitled/core/features/payment/widgets/pay_button.dart';
import 'package:untitled/core/features/payment/widgets/payment_app_bar.dart';
import 'package:untitled/core/features/payment/widgets/payment_methods_section.dart';
import 'package:untitled/core/features/payment/widgets/security_footer.dart';

class SSLCommerzPayment extends StatefulWidget {
  const SSLCommerzPayment({super.key});

  @override
  State<SSLCommerzPayment> createState() => _SSLCommerzPaymentState();
}

class _SSLCommerzPaymentState extends State<SSLCommerzPayment> {
  final double totalPrice = 100.00;

  Future<void> _onPayPressed() async {
    final sslcommerz = Sslcommerz(
      initializer: SSLCommerzInitialization(
        multi_card_name: "visa,master,bkash",
        currency: SSLCurrencyType.BDT,
        product_category: "Digital Product",
        sdkType: SSLCSdkType.TESTBOX,
        store_id: "9pmte68d133d6d9c03",
        store_passwd: "9pmte68d133d6d9c03@ssl",
        total_amount: totalPrice,
        tran_id: "TestTRX001",
      ),
    );

    final response = await sslcommerz.payNow();

    if (!mounted) return;

    switch (response.status) {
      case 'VALID':
        _showSnack(
          message: 'Payment Successful',
          sub: 'TRX ID: ${response.tranId}',
          color: AppColors.success,
          surface: AppColors.successSurface,
          icon: Icons.check_circle_rounded,
        );
      case 'Closed':
        _showSnack(
          message: 'Payment Cancelled',
          sub: 'You closed the payment window.',
          color: AppColors.warning,
          surface: AppColors.warningSurface,
          icon: Icons.cancel_rounded,
        );
      case 'FAILED':
        _showSnack(
          message: 'Payment Failed',
          sub: 'Please try again.',
          color: AppColors.error,
          surface: AppColors.errorSurface,
          icon: Icons.error_rounded,
        );
    }
  }

  void _showSnack({
    required String message,
    required String sub,
    required Color color,
    required Color surface,
    required IconData icon,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 32),
        backgroundColor: surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: BorderSide(color: color.withOpacity(0.35), width: 1.2),
        ),
        content: Row(
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    message,
                    style: TextStyle(color: color, fontWeight: FontWeight.w700, fontSize: 13),
                  ),
                  Text(sub, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
        duration: const Duration(seconds: 4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(child: PaymentAppBar()),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 40),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  OrderSummaryCard(totalPrice: totalPrice),
                  const SizedBox(height: 16),

                  const PaymentMethodsSection(),
                  const SizedBox(height: 16),

                  AmountBreakdownCard(totalPrice: totalPrice),
                  const SizedBox(height: 28),

                  PayButton(onPressed: _onPayPressed),
                  const SizedBox(height: 20),

                  const SecurityFooter(),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
