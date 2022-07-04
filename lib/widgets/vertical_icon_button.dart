import 'package:flutter/material.dart';

class VerticalIconButton extends StatelessWidget {
  final IconData? icon;
  final String? title;
  final void Function()? onTap;

  VerticalIconButton({this.icon, this.title, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(
            height: 4.0,
          ),
          Text(title!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
