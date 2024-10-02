import 'package:diary_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class OverlayLoadingHolder extends StatelessWidget {
  const OverlayLoadingHolder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black.withOpacity(.6),
      child: const Center(child: CircularLoadingGrey()),
    );
  }
}

class CircularLoading extends StatelessWidget {
  const CircularLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 25,
      width: 25,
      child: CircularProgressIndicator.adaptive(),
    );
  }
}

class CircularLoadingGrey extends StatelessWidget {
  const CircularLoadingGrey({super.key, this.size = 35});
  final double size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(kYellow),
        strokeWidth: 2,
      ),
    );
  }
}
