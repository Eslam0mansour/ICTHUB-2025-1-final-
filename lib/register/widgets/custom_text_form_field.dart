import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    super.key,
    required this.labelText,
    this.suffixIcon,
    this.isHidden,
    this.keyboardType,
    this.prefIcon, this.controller,
  });
  final String labelText;
  final Widget? suffixIcon;
  final IconData? prefIcon;
  final bool? isHidden;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.black,
      obscuringCharacter: "*",
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      obscureText: isHidden ?? false,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        prefixIcon: Icon(prefIcon),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 2,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
