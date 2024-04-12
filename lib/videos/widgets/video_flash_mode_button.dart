import 'package:flutter/material.dart';

class FlashButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final Color color;

  const FlashButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: color,
      onPressed: () => onPressed(),
      icon: Icon(icon),
    );
  }
}
