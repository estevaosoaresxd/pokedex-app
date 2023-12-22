import "package:flutter/material.dart";

extension SizeExtension on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);
  EdgeInsets get paddingSize => MediaQuery.paddingOf(this);
}
