import 'package:evently/common/widgets/event_card.dart';
import 'package:flutter/material.dart';

class EnentListView extends StatelessWidget {
  const EnentListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return EventCard();
        },
      ),
    );
  }
}
