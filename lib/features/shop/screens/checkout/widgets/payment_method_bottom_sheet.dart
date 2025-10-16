import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PaymentMethodBottomSheet extends StatelessWidget {
  final String selectedMethod;
  final Function(String) onMethodSelected;

  const PaymentMethodBottomSheet({
    super.key,
    required this.selectedMethod,
    required this.onMethodSelected,
  });

  final List<PaymentMethod> paymentMethods = const [
    PaymentMethod(name: 'Apple Pay', icon: '🍎', color: Colors.black),
    PaymentMethod(name: 'Visa', icon: '💳', color: Colors.blue),
    PaymentMethod(name: 'Master Card', icon: '💳', color: Colors.red),
    PaymentMethod(name: 'PayPal', icon: '💙', color: Colors.blue),
    PaymentMethod(name: 'Paystack', icon: '💚', color: Colors.green),
    PaymentMethod(name: 'Credit Card', icon: '💳', color: Colors.purple),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            isDark ? Colors.grey[900]! : Colors.white,
            isDark ? Colors.grey[850]! : Colors.grey[50]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 20,
            offset: const Offset(0, -10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.blue, Colors.purple],
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Iconsax.card, color: Colors.white, size: 20),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Select Payment Method',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ...paymentMethods.map((method) => PaymentMethodTile(
            method: method,
            isSelected: selectedMethod == method.name,
            onTap: () {
              onMethodSelected(method.name);
              Navigator.pop(context);
            },
          )),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class PaymentMethodTile extends StatelessWidget {
  final PaymentMethod method;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentMethodTile({
    super.key,
    required this.method,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      decoration: BoxDecoration(
        gradient: isSelected 
          ? LinearGradient(
              colors: [
                method.color.withValues(alpha: 0.2),
                method.color.withValues(alpha: 0.1),
              ],
            )
          : null,
        color: isSelected ? null : (isDark ? Colors.grey[800] : Colors.white),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected 
            ? method.color 
            : Colors.grey.withValues(alpha: 0.2),
          width: isSelected ? 2 : 1,
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: method.color.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(method.icon, style: const TextStyle(fontSize: 20)),
        ),
        title: Text(
          method.name,
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        trailing: isSelected 
          ? Icon(Iconsax.tick_circle, color: method.color, size: 24)
          : Icon(
              Iconsax.arrow_right_3,
              color: isDark ? Colors.grey[400] : Colors.grey[600],
            ),
        onTap: onTap,
      ),
    );
  }
}

class PaymentMethod {
  final String name;
  final String icon;
  final Color color;

  const PaymentMethod({
    required this.name,
    required this.icon,
    required this.color,
  });
}