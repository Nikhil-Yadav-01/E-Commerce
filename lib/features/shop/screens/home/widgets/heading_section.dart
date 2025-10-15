import 'package:flutter/material.dart';


class RSectionHeading extends StatelessWidget {
  const RSectionHeading({
    super.key,
    required this.title,
    this.onPressed,
    this.buttonTitle = 'View All',
    this.showActionButton = false,
  });

  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (showActionButton)
                TextButton(onPressed: onPressed, child: Text(buttonTitle)),
            ],
          ),
        ]
    );
  }
}
