import "package:flutter/material.dart";
import "package:flutter/services.dart";

class TextFormFieldPin extends StatelessWidget {
  final bool autoFocus;
  final TextEditingController controller;
  const TextFormFieldPin({
    super.key,
    this.autoFocus = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: 48,
      child: TextFormField(
        autofocus: autoFocus,
        controller: controller,
        textAlignVertical: TextAlignVertical.top,
        cursorColor: Colors.black,
        cursorWidth: 2,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && autoFocus != true) {
            FocusScope.of(context).previousFocus();
          }
        },
        decoration: const InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: 2,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 2,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 2,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
        ),
        // style: Theme.of(context).textTheme.titleLarge,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}
