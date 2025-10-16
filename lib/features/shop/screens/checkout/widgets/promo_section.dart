import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PromoSection extends StatefulWidget {
  final VoidCallback? onPromoApplied;
  final bool isSmallScreen;

  const PromoSection({
    super.key,
    this.onPromoApplied,
    this.isSmallScreen = false,
  });

  @override
  State<PromoSection> createState() => _PromoSectionState();
}

class _PromoSectionState extends State<PromoSection> {
  final TextEditingController _promoController = TextEditingController();
  bool _isPromoApplied = false;
  bool _showPromoInput = false;

  @override
  void dispose() {
    _promoController.dispose();
    super.dispose();
  }

  void _applyPromoCode() {
    if (_promoController.text.isNotEmpty) {
      setState(() {
        _isPromoApplied = true;
        _showPromoInput = false;
      });
      widget.onPromoApplied?.call();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Promo code "${_promoController.text}" applied!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return GestureDetector(
      onTap: () {
        if (!_isPromoApplied && !_showPromoInput) {
          setState(() {
            _showPromoInput = true;
          });
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: widget.isSmallScreen ? 12 : 20),
        padding: EdgeInsets.all(widget.isSmallScreen ? 16 : 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              _isPromoApplied 
                ? Colors.green.withValues(alpha: 0.1)
                : Colors.orange.withValues(alpha: 0.1),
              _isPromoApplied 
                ? Colors.teal.withValues(alpha: 0.05)
                : Colors.red.withValues(alpha: 0.05),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _isPromoApplied 
              ? Colors.green.withValues(alpha: 0.3)
              : Colors.orange.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!_showPromoInput && !_isPromoApplied) ...[
              _buildPromoPrompt(isDark),
            ] else if (_showPromoInput && !_isPromoApplied) ...[
              _buildPromoInput(isDark),
            ] else if (_isPromoApplied) ...[
              _buildPromoApplied(isDark),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildPromoPrompt(bool isDark) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.orange.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Iconsax.ticket_discount, color: Colors.orange),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Promo Code',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white : Colors.black87,
                ),
              ),
              Text(
                'Have a promo code? Enter here',
                style: TextStyle(
                  fontSize: 12,
                  color: isDark ? Colors.grey[400] : Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
        Icon(
          Iconsax.arrow_right_3,
          color: Colors.orange,
          size: 20,
        ),
      ],
    );
  }

  Widget _buildPromoInput(bool isDark) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Iconsax.ticket_discount, color: Colors.orange),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextField(
                controller: _promoController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Enter promo code',
                  hintStyle: TextStyle(
                    color: isDark ? Colors.grey[500] : Colors.grey[400],
                  ),
                  filled: true,
                  fillColor: isDark ? Colors.grey[800] : Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black87,
                ),
                onSubmitted: (value) => _applyPromoCode(),
              ),
            ),
            const SizedBox(width: 12),
            GestureDetector(
              onTap: _applyPromoCode,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.orange, Colors.red],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Apply',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: () {
            setState(() {
              _showPromoInput = false;
              _promoController.clear();
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Cancel',
              style: TextStyle(
                color: isDark ? Colors.grey[400] : Colors.grey[600],
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPromoApplied(bool isDark) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.green.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Iconsax.tick_circle, color: Colors.green),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Promo Applied!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.green,
                ),
              ),
              Text(
                'Code: ${_promoController.text}',
                style: TextStyle(
                  fontSize: 12,
                  color: isDark ? Colors.grey[400] : Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isPromoApplied = false;
              _showPromoInput = false;
              _promoController.clear();
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.red.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.red.withValues(alpha: 0.3)),
            ),
            child: const Text(
              'Remove',
              style: TextStyle(
                color: Colors.red,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}