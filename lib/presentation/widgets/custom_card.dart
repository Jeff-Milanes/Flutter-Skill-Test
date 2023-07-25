import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    required this.title,
    this.isHighlight = false,
    this.child,
    super.key,
  });

  final String title;
  final bool isHighlight;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(6)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  top: 18,
                  bottom: 5,
                ),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isHighlight ? Colors.black : Colors.grey[700],
                  ),
                ),
              ),
              if (isHighlight)
                SizedBox(
                  height: 50,
                  child: Checkbox(
                    value: true,
                    onChanged: (_) {},
                  ),
                )
            ],
          ),
          const Divider(
            indent: 15,
            endIndent: 12,
            color: Color.fromARGB(255, 225, 224, 224),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25, left: 15, right: 15),
            child: child ?? const SizedBox(),
          ),
        ],
      ),
    );
  }
}
