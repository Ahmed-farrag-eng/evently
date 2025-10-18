import 'package:flutter/material.dart';

class CategoryModel {
  int id;
  String title;
  IconData icon;

  CategoryModel({required this.id, required this.title, required this.icon});
  static List<CategoryModel> get categories => [
    CategoryModel(id: 1, title: "All", icon: Icons.explore_outlined),
    CategoryModel(id: 2, title: "Sport", icon: Icons.directions_bike),
    CategoryModel(id: 3, title: "BirthDay", icon: Icons.cake_rounded),
    CategoryModel(id: 4, title: "meating", icon: Icons.meeting_room),
    CategoryModel(id: 5, title: "WorkShop", icon: Icons.handyman),
    CategoryModel(id: 6, title: "Eating", icon: Icons.food_bank),
  ];
}
