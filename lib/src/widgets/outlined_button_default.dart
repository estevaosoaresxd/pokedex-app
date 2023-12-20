import "package:flutter/material.dart";

class OutlinedButtonDefault extends StatelessWidget {
  final String title;
  final Widget? iconOutside;
  final IconData icon;
  final Function()? onPressed;
  final Color? backgroundColor;
  final TextStyle? style;
  const OutlinedButtonDefault({
    required this.title,
    super.key,
    this.onPressed,
    this.backgroundColor,
    this.style,
    required this.icon,
    this.iconOutside,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        fixedSize: const Size.fromHeight(58),
        side: BorderSide(
          color: Colors.grey[300]!,
          width: 2,
        ),
      ),
      icon: iconOutside ??
          Icon(
            icon,
            size: 30,
            color: Colors.black,
          ),
      label: Text(
        title,
        style: style ??
            Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.grey[800]),
      ),
    );
  }
}
