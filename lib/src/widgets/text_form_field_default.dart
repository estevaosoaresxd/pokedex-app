import "package:flutter/material.dart";

class TextFormFieldDefault extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType? textInputType;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final bool isPassword;
  final bool isSearch;
  const TextFormFieldDefault({
    super.key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.isSearch = false,
    this.textInputType,
    this.focusNode,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> obscureText = ValueNotifier<bool>(false);

    if (isPassword) {
      obscureText.value = true;
    }

    return ValueListenableBuilder(
      valueListenable: obscureText,
      builder: (context, value, _) => TextFormField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: textInputType,
        onChanged: onChanged,
        onFieldSubmitted: onSubmitted,
        obscureText: value,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    value
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    obscureText.value = !obscureText.value;
                  },
                )
              : null,
          prefixIcon: isSearch
              ? const Icon(
                  Icons.search,
                  size: 24,
                )
              : null,
          isDense: isSearch ? true : false,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(isSearch ? 32 : 6),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 2,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(isSearch ? 32 : 6),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 2,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(isSearch ? 32 : 6),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 2,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(isSearch ? 32 : 6),
            ),
          ),
        ),
      ),
    );
  }
}
