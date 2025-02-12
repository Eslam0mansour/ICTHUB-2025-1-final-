import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    required this.text,
    this.isLoading = false,
  });

  final void Function()? onPressed;
  final String text;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                8,
              ),
            ),
          ),
          backgroundColor: Color(0xffC0E862),
          foregroundColor: Colors.black,
        ),
        onPressed: onPressed,
        child: isLoading ? CircularProgressIndicator() : Text(text),
      ),
    );
  }
}
