import 'dart:io';

import 'package:flutter/material.dart';

class Photo extends StatelessWidget {
  const Photo({super.key, required this.file});

  final File file;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            right: 15,
            top: 10,
          ),
          child: Image.file(
            file,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
            top: 2,
            right: 5,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: const Icon(
                Icons.close,
                color: Colors.white,
                size: 15,
              ),
            )),
      ],
    );
  }
}
