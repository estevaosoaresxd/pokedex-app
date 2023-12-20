import "package:flutter/material.dart";

class CircularButtonDefault extends StatelessWidget {
  final Function()? onPressed;
  final Color? backgroundColor;
  final String title;
  final TextStyle? style;
  const CircularButtonDefault(
      {super.key,
      this.onPressed,
      this.backgroundColor,
      required this.title,
      this.style});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        fixedSize: const Size.fromHeight(58),
      ),
      child: Text(
        title,
        style: style ?? Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
