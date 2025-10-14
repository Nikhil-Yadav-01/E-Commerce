import 'package:flutter/material.dart';


class OrSign extends StatelessWidget {
  const OrSign({
    super.key,
    required this.isDark,
    required this.title,
  });

  final bool isDark;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Divider(
              color: isDark ? Colors.grey[700] : Colors.grey[300],
              thickness: 1,
              indent: 60,
              endIndent: 5,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: isDark ? Colors.grey[400] : Colors.grey[600],
              fontSize: 14,
            ),
          ),
          Flexible(
            child: Divider(
              color: isDark ? Colors.grey[700] : Colors.grey[300],
              thickness: 1,
              indent: 5,
              endIndent: 60,
            ),
          ),
        ],
      );
  }
}