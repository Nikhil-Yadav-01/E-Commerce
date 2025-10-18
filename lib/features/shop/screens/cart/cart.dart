import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../common/widgets/app_bar.dart';
import '../checkout/checkout.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with TickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _fadeAnimation;
  final List<CartItem> cartItems = [
    CartItem(
      id: '1',
      name: 'Green Nike sports shoe',
      color: 'Green',
      size: 'Size 8',
      price: 334.0,
      quantity: 1,
      image: '🟢',
    ),
    CartItem(
      id: '2',
      name: 'Blue T-shirt for all ages',
      color: 'Blue',
      size: '',
      price: 35.0,
      quantity: 1,
      image: '👕',
    ),
    CartItem(
      id: '3',
      name: 'Nike basketball shoes Black & Green',
      color: 'Black',
      size: '',
      price: 400.0,
      quantity: 1,
      image: '🔴',
    ),
    CartItem(
      id: '4',
      name: 'Adidas Football',
      color: '',
      size: '',
      price: 40.0,
      quantity: 1,
      image: '⚽',
    ),
    CartItem(
      id: '5',
      name: 'iPhone 14 pro 512gb',
      color: '',
      size: '',
      price: 1999.0,
      quantity: 2,
      image: '📱',
    ),
  ];

  double get totalAmount {
    return cartItems.fold(
      0.0,
      (sum, item) => sum + (item.price * item.quantity),
    );
  }

  void updateQuantity(String id, int newQuantity) {
    setState(() {
      final index = cartItems.indexWhere((item) => item.id == id);
      if (index != -1) {
        if (newQuantity > 0) {
          cartItems[index].quantity = newQuantity;
        } else {
          cartItems.removeAt(index);
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController!, curve: Curves.easeInOut),
    );
    _animationController?.forward();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;
    
    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : const Color(0xFFF8F9FA),
      appBar: RAppBar(
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: isDark ? Colors.white : RColors.primaryDark,
            fontWeight: FontWeight.w600,
          ),
        ),
        showBackArrow: true,

      ),
      body: _fadeAnimation != null ? FadeTransition(
        opacity: _fadeAnimation!,
        child: Column(
          children: [
            Expanded(
              child: CartItemsList(
                items: cartItems,
                onQuantityChanged: updateQuantity,
              ),
            ),
            CheckoutSection(totalAmount: totalAmount, itemsCount: cartItems.length,),
          ],
        ),
      ) : Column(
          children: [
            Expanded(
              child: CartItemsList(
                items: cartItems,
                onQuantityChanged: updateQuantity,
              ),
            ),
            CheckoutSection(totalAmount: totalAmount, itemsCount: cartItems.length,),
          ],
        ),
    );
  }

  Widget _buildCartHeader() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;
    
    return Container(
      margin: EdgeInsets.fromLTRB(isSmallScreen ? 12 : 16, 8, isSmallScreen ? 12 : 16, 8),
      padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 12 : 16, vertical: isSmallScreen ? 8 : 12),
      decoration: BoxDecoration(
        gradient: RColors.checkoutOrderGradient,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: RColors.checkoutOrderColor.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Iconsax.shopping_cart,
            color: RColors.checkoutOrderColor,
            size: isSmallScreen ? 18 : 20,
          ),
          SizedBox(width: isSmallScreen ? 8 : 12),
          Expanded(
            child: Text(
              '${cartItems.length} items',
              style: TextStyle(
                fontSize: isSmallScreen ? 12 : 14,
                fontWeight: FontWeight.w600,
                color: RColors.checkoutOrderColor,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 8 : 10, vertical: 4),
            decoration: BoxDecoration(
              gradient: RColors.checkoutButtonGradient,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '\$${totalAmount.toStringAsFixed(0)}',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: isSmallScreen ? 12 : 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartItemsList extends StatelessWidget {
  final List<CartItem> items;
  final Function(String, int) onQuantityChanged;

  const CartItemsList({
    super.key,
    required this.items,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;
    
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 12 : 16, vertical: 8),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return CartItemWidget(
          item: item,
          onQuantityChanged: (newQuantity) =>
              onQuantityChanged(item.id, newQuantity),
        );
      },
    );
  }
}

class CheckoutSection extends StatelessWidget {
  final double totalAmount;
  final int itemsCount;

  const CheckoutSection({super.key, required this.totalAmount, required this.itemsCount});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 12 : 16, vertical: 8),
      color: Colors.transparent,
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: isSmallScreen ? 44 : 48,
          decoration: BoxDecoration(
            gradient: RColors.checkoutButtonGradient,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: RColors.checkoutOrderColor.withValues(alpha: 0.3),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CheckoutScreen()),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Iconsax.shopping_cart,
                  color: Colors.white,
                  size: isSmallScreen ? 20 : 24,
                ),
                SizedBox(width: isSmallScreen ? 8 : 12),
                Text(
                  'Checkout ',
                  style: Theme.of(context).textTheme.titleLarge!.apply(
                    color: Colors.white,
                    fontWeightDelta: 2,
                  ),
                ),
                SizedBox(width: isSmallScreen ? 12 : 20),
                Text(
                  '$itemsCount items',
                  style: Theme.of(context).textTheme.labelLarge!.apply(
                  color: Colors.white,
                  fontWeightDelta: 2,
                ),
                ),
                SizedBox(width: isSmallScreen ? 12 : 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 8 : 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '\$${totalAmount.toStringAsFixed(1)}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isSmallScreen ? 14 : 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CartItem {
  final String id;
  final String name;
  final String color;
  final String size;
  final double price;
  int quantity;
  final String image;

  CartItem({
    required this.id,
    required this.name,
    required this.color,
    required this.size,
    required this.price,
    required this.quantity,
    required this.image,
  });
}

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final Function(int) onQuantityChanged;

  const CartItemWidget({
    super.key,
    required this.item,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;

    return Container(
      margin: EdgeInsets.only(bottom: isSmallScreen ? 8 : 12),
      padding: EdgeInsets.all(isSmallScreen ? 8 : 12),
      decoration: BoxDecoration(
        color: isDark ? RColors.cardDark : RColors.cardLight,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          ProductImage(image: item.image, isSmallScreen: isSmallScreen),
          SizedBox(width: isSmallScreen ? 12 : 16),
          Expanded(
            child: ProductDetails(
              item: item,
              onQuantityChanged: onQuantityChanged,
              isSmallScreen: isSmallScreen,
            ),
          ),
          ProductPrice(price: item.price * item.quantity, isSmallScreen: isSmallScreen),
        ],
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  final String image;
  final bool isSmallScreen;

  const ProductImage({super.key, required this.image, this.isSmallScreen = false});

  @override
  Widget build(BuildContext context) {
    final size = isSmallScreen ? 50.0 : 60.0;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            RColors.checkoutOrderColor.withValues(alpha: 0.2),
            RColors.checkoutPaymentColor.withValues(alpha: 0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          image,
          style: TextStyle(fontSize: isSmallScreen ? 24 : 28),
        ),
      ),
    );
  }
}

class ProductDetails extends StatelessWidget {
  final CartItem item;
  final Function(int) onQuantityChanged;
  final bool isSmallScreen;

  const ProductDetails({
    super.key,
    required this.item,
    required this.onQuantityChanged,
    this.isSmallScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.name,
          style: TextStyle(
            fontSize: isSmallScreen ? 14 : 16,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white : Colors.black87,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: isSmallScreen ? 1 : 2,
        ),
        const SizedBox(height: 4),
        if (item.color.isNotEmpty || item.size.isNotEmpty)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: RColors.checkoutOrderColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '${item.color} ${item.size}'.trim(),
              style: TextStyle(
                fontSize: 12,
                color: RColors.checkoutOrderColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        const SizedBox(height: 12),
        QuantityControls(
          quantity: item.quantity,
          onQuantityChanged: onQuantityChanged,
        ),
      ],
    );
  }
}

class QuantityControls extends StatelessWidget {
  final int quantity;
  final Function(int) onQuantityChanged;

  const QuantityControls({
    super.key,
    required this.quantity,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;
    
    return Row(
      children: [
        QuantityButton(
          icon: Iconsax.minus,
          onTap: () => onQuantityChanged(quantity - 1),
          isSmallScreen: isSmallScreen,
        ),
        SizedBox(width: isSmallScreen ? 8 : 12),
        Container(
          width: isSmallScreen ? 32 : 40,
          height: isSmallScreen ? 32 : 40,
          decoration: BoxDecoration(
            gradient: RColors.checkoutButtonGradient,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: RColors.checkoutOrderColor.withValues(alpha: 0.3),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Text(
              '$quantity',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: isSmallScreen ? 14 : 16,
              ),
            ),
          ),
        ),
        SizedBox(width: isSmallScreen ? 8 : 12),
        QuantityButton(
          icon: Iconsax.add,
          onTap: () => onQuantityChanged(quantity + 1),
          isSmallScreen: isSmallScreen,
        ),
      ],
    );
  }
}

class QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool isSmallScreen;

  const QuantityButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.isSmallScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = isSmallScreen ? 28.0 : 32.0;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              isDark ? Colors.grey[700]! : Colors.grey[200]!,
              isDark ? Colors.grey[600]! : Colors.grey[100]!,
            ],
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          icon,
          size: isSmallScreen ? 16 : 18,
          color: isDark ? Colors.white : Colors.black87,
        ),
      ),
    );
  }
}

class ProductPrice extends StatelessWidget {
  final double price;
  final bool isSmallScreen;

  const ProductPrice({super.key, required this.price, this.isSmallScreen = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 8 : 12, vertical: isSmallScreen ? 6 : 8),
      decoration: BoxDecoration(
        gradient: RColors.checkoutButtonGradient,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        '\$${price.toStringAsFixed(1)}',
        style: TextStyle(
          fontSize: isSmallScreen ? 14 : 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
