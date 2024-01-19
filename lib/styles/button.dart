import 'package:flutter/material.dart';

class NewButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const NewButton({super.key, this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(10)
        ),
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
                fontSize: 18
            ),
          ),
        ),
      ),
    );
  }
}
