import 'package:evently/screens/home/views/enent_list_view.dart';
import 'package:evently/screens/home/views/home_header.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(spacing: 0, children: [HomeHeader(), EnentListView()]);
  }
}
