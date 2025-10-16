import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OrderSummarySection extends StatelessWidget {
  final double subtotal;
  final double shippingFee;
  final double taxFee;
  final double total;

  const OrderSummarySection({
    super.key,
    required this.subtotal,
    required this.shippingFee,
    required this.taxFee,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[850] : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Iconsax.receipt_1, color: Colors.green, size: 24),
              const SizedBox(width: 12),
              const Text(
                'Order Summary',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SummaryRow(label: 'Subtotal', amount: '\$${subtotal.toStringAsFixed(1)}'),
          SummaryRow(label: 'Shipping Fee', amount: '\$${shippingFee.toStringAsFixed(1)}'),
          SummaryRow(label: 'Tax Fee', amount: '\$${taxFee.toStringAsFixed(1)}'),
          const Divider(height: 30),
          SummaryRow(label: 'Order Total', amount: '\$${total.toStringAsFixed(1)}', isTotal: true),
        ],
      ),
    );
  }
}

class SummaryRow extends StatelessWidget {
  final String label;
  final String amount;
  final bool isTotal;

  const SummaryRow({
    super.key,
    required this.label,
    required this.amount,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 18 : 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
              color: isTotal 
                ? Colors.green 
                : (isDark ? Colors.white70 : Colors.black87),
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: isTotal ? 18 : 16,
              fontWeight: FontWeight.bold,
              color: isTotal 
                ? Colors.green 
                : (isDark ? Colors.white : Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}