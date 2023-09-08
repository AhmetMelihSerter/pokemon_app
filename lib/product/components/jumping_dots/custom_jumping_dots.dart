import 'package:flutter/material.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:kartal/kartal.dart';

class CustomJumpingDots extends StatelessWidget {
  const CustomJumpingDots({super.key});

  @override
  Widget build(BuildContext context) {
    return JumpingDots(
      color: context.general.appTheme.primaryColor,
    );
  }
}
