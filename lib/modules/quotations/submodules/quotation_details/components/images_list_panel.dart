import 'package:flutter/material.dart';
import 'package:quotations/core/theme/colors.dart';

class ImagesListPanel extends StatelessWidget {
  const ImagesListPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (var i = 0; i < 10; i++)
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(16))),
            )
        ],
      ),
    );
  }
}
