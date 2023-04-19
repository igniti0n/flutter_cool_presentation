import 'package:flutter/material.dart';
import 'package:presa_talk/_shared/lib/ui/placeholder/placeholder_card_short.dart';

class AccountContent extends StatelessWidget {
  const AccountContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: ListView.builder(
        itemCount: 9,
        itemBuilder: (content, index) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: PlaceholderCardShort(
              color: const Color(0xFF99D3F7),
              backgroundColor: const Color(0xFFC7EAFF),
            ),
          );
        },
      ),
    );
  }
}
