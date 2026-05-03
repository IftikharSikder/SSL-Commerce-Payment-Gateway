import 'package:flutter/material.dart';
import 'package:untitled/core/features/payment/ssl_payment_screen.dart';

import 'core/app_colors.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldBg,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.gold),
      ),
      home: const SSLCommerzPayment(),
    );
  }
}
