import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AnimatedTextKitWidget extends StatelessWidget {
  const AnimatedTextKitWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
          color: Colors.black, fontSize: 40.0, fontWeight: FontWeight.bold),
      child: AnimatedTextKit(
        animatedTexts: [
          WavyAnimatedText('Flash Chat'),
        ],
        isRepeatingAnimation: true,
      ),
    );
  }
}
