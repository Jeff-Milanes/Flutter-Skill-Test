import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    required this.hintText,
    this.onChanged,
    this.isDropdownButtonEnabled = false,
    super.key,
  });

  final String hintText;
  final bool isDropdownButtonEnabled;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: TextField(
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.grey),
            ),
          ),
        ),
        if (isDropdownButtonEnabled)
          const Positioned(
              right: 0,
              top: 15,
              child: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.grey,
              ))
      ],
    );
  }
}
