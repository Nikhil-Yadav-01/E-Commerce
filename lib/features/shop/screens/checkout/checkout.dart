import 'package:e_commerce/common/widgets/app_bar.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'widgets/checkout_button.dart';
import 'widgets/order_items_section.dart';
import 'widgets/order_summary_section.dart';
import 'widgets/payment_method_bottom_sheet.dart';
import 'widgets/payment_section.dart';
import 'widgets/promo_section.dart';
import 'widgets/shipping_section.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen>
    with TickerProviderStateMixin {
  String selectedPaymentMethod = 'PayPal';
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  final List<OrderItem> orderItems = [
    OrderItem(
      name: 'Nike Track suit red',
      price: 400.0,
      image: RImages.productImage22,
    ),
    OrderItem(
      name: 'Green Nike sports shoe',
      price: 334.0,
      image: RImages.productImage22,
    ),
  ];

  final Map<String, PaymentMethodInfo> paymentMethodsInfo = {
    'Apple Pay': PaymentMethodInfo(icon: '🍎', color: Colors.black),
    'Visa': PaymentMethodInfo(icon: '💳', color: Colors.blue),
    'Master Card': PaymentMethodInfo(icon: '💳', color: Colors.red),
    'PayPal': PaymentMethodInfo(icon: '💙', color: Colors.blue),
    'Paystack': PaymentMethodInfo(icon: '💚', color: Colors.green),
    'Credit Card': PaymentMethodInfo(icon: '💳', color: Colors.purple),
  };

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _showPaymentMethods() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) => PaymentMethodBottomSheet(
        selectedMethod: selectedPaymentMethod,
        onMethodSelected: (method) {
          setState(() {
            selectedPaymentMethod = method;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;

    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF121212)
          : const Color(0xFFF8F9FA),
      appBar: RAppBar(
        title: Text(
          'Order Review',
          style: TextStyle(
            fontSize: isSmallScreen ? 18 : 20,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        showBackArrow: true,
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              OrderItemsSection(orderItems: orderItems, isSmallScreen: isSmallScreen),
              PromoSection(isSmallScreen: isSmallScreen),
              OrderSummarySection(
                subtotal: 334.0,
                shippingFee: 6.0,
                taxFee: 40.0,
                total: 1015.4,
                isSmallScreen: isSmallScreen,
              ),
              PaymentSection(
                selectedPaymentMethod: selectedPaymentMethod,
                paymentMethodsInfo: paymentMethodsInfo,
                onChangePayment: _showPaymentMethods,
                isSmallScreen: isSmallScreen,
              ),
              ShippingSection(
                customerName: 'Nikhil Yadav',
                phoneNumber: '+92 317 8059 525',
                isSmallScreen: isSmallScreen,
              ),
              SizedBox(height: isSmallScreen ? RSizes.sm : RSizes.spaceBtwItems),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CheckoutButton(totalAmount: 1015.4, isSmallScreen: isSmallScreen),
    );
  }
}
