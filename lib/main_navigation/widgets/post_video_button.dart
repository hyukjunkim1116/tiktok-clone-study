import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

import '../../utils.dart';

class PostVideoButton extends StatefulWidget {
  const PostVideoButton({
    super.key,
    required this.height,
    required this.inverted,
  });

  final bool inverted;
  final double height;

  @override
  State<PostVideoButton> createState() => _PostVideoButtonState();
}

class _PostVideoButtonState extends State<PostVideoButton> {
  Timer? _timer;
  bool _isBubbleVisible = false;

  void _startTimer() {
    _timer = Timer(const Duration(seconds: 1), () {
      setState(() {
        _isBubbleVisible = true;
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    setState(() {
      _isBubbleVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return GestureDetector(
      onLongPressStart: (details) {
        print("i m pressed");
        _startTimer();
      },
      onLongPressEnd: (details) {
        _stopTimer();
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: 20,
            child: Container(
              height: widget.height,
              width: 25,
              decoration: BoxDecoration(
                color: const Color(0xff61D4F0),
                borderRadius: BorderRadius.circular(
                  Sizes.size16,
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            child: Container(
              height: widget.height,
              width: 25,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(
                  Sizes.size16,
                ),
              ),
            ),
          ),
          Container(
            height: widget.height,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size11,
            ),
            decoration: BoxDecoration(
              color: !widget.inverted || isDark ? Colors.white : Colors.black,
              borderRadius: BorderRadius.circular(
                Sizes.size6,
              ),
            ),
            child: AnimatedOpacity(
              opacity: _isBubbleVisible ? 0 : 1,
              duration: const Duration(milliseconds: 300),
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.plus,
                  color: !widget.inverted || isDark ? Colors.black : Colors.white,
                  size: 18,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
