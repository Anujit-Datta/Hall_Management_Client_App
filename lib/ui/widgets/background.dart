import 'package:flutter/material.dart';
import 'package:hall_management_client/utils/context_extensions.dart';

class Background extends StatelessWidget {
  const Background({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: context.theme.secondaryHeaderColor.withOpacity(0.65),
          ),
        ),
        Center(child: child),
      ],
    );
  }
}
