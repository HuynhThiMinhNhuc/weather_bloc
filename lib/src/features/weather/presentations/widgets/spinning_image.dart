import 'package:example_app/src/core/theme/dimens.dart';
import 'package:flutter/material.dart';

class SpinningImage extends StatefulWidget {
  const SpinningImage({super.key});

  @override
  State<SpinningImage> createState() => _SpinningImageState();
}

class _SpinningImageState extends State<SpinningImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(); // Infinite spin
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F7),
      body: Center(
        child: RotationTransition(
          turns: _controller,
          child: Image.asset(
            'assets/icons/drawable-mdpi/ic_loading.png',
            width: Dimens.pt96,
            height: Dimens.pt96,
          ),
        ),
      ),
    );
  }
}
