// Custom TextField Widget for Sign Up
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/colors.dart';

class RTextField extends StatefulWidget {
  final IconData prefixIcon;
  final String hintText;
  final bool isPassword;
  final bool isDark;

  const RTextField({
    super.key,
    required this.prefixIcon,
    required this.hintText,
    this.isPassword = false,
    required this.isDark,
  });

  @override
  State<RTextField> createState() => _RTextFieldState();
}

class _RTextFieldState extends State<RTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: widget.isDark ? RColors.borderNeutralDark : RColors.borderNeutralLight,
          width: 1,
        ),
      ),
      child: TextField(
        obscureText: widget.isPassword && _obscureText,
        style: TextStyle(
          color: widget.isDark ? RColors.onPrimaryDark : RColors.onPrimaryLight,
          fontSize: 14,
        ),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: widget.isDark ? RColors.onMutedDark : RColors.onMutedLight,
            fontSize: 14,
          ),
          prefixIcon: Icon(
            widget.prefixIcon,
            color: widget.isDark ? RColors.onMutedDark : RColors.onMutedLight,
            size: 20,
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            icon: Icon(
              _obscureText ? Iconsax.eye_slash : Iconsax.eye,
              color: widget.isDark ? RColors.onMutedDark : RColors.onMutedLight,
              size: 20,
            ),
          )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
      ),
    );
  }
}