import 'package:flutter/material.dart';

class UnSelectedOptionWidget extends StatelessWidget {
  final String titleUnselectedOption;
  const UnSelectedOptionWidget({super.key,required this.titleUnselectedOption});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          width: double.infinity,
          child: Text(titleUnselectedOption,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 25),)),
    );
  }
}
