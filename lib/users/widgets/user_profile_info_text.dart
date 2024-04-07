import 'package:flutter/material.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';

class UserProfileInfoText extends StatelessWidget {
  final String info;
  final String description;
  final double infoSize;
  final Color descriptionColor;

  const UserProfileInfoText({
    super.key,
    required this.info,
    required this.description,
    required this.infoSize,
    required this.descriptionColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          info,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: infoSize,
          ),
        ),
        Gaps.v3,
        Text(description,
            style: TextStyle(
              color: descriptionColor,
            ))
      ],
    );
  }
}
