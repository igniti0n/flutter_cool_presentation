import 'package:flutter/material.dart';
import 'package:presa_talk/_shared/lib/ui/placeholder/placeholder_image_with_text.dart';

class GridContent extends StatelessWidget {
  const GridContent({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLandscape = MediaQuery.of(context).size.aspectRatio > 1;
    var columnCount = isLandscape ? 3 : 2;

    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 20),
      child: GridView.count(
        crossAxisCount: columnCount,
        children: List.generate(20, (index) {
          return PlaceholderImageWithText(
              color: const Color(0xFF99D3F7),
              backgroundColor: const Color(0xFFC7EAFF));
        }),
      ),
    );
  }
}
