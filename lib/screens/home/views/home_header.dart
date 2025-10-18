import 'package:evently/common/theme/app_assets.dart';
import 'package:evently/common/theme/app_colors.dart';
import 'package:evently/common/theme/app_theme.dart';
import 'package:evently/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcomeback✨",
                      style: Theme.of(
                        context,
                      ).textTheme.labelLarge!.copyWith(color: Colors.white),
                    ),
                    Text(
                      "John Safawt",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 11),
                    Row(
                      spacing: 4,
                      children: [
                        SvgPicture.asset(AppAssets.mapOutlinedSvg),

                        Text(
                          "Cairo , Egypt",
                          style: Theme.of(
                            context,
                          ).textTheme.titleSmall!.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),

                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(AppAssets.themeIconSvg),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(AppAssets.langIconSvg),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            FilterView(),
          ],
        ),
      ),
    );
  }
}

class FilterView extends StatefulWidget {
  const FilterView({super.key});

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  int selectedId = CategoryModel.categories.first.id;
  List<CategoryModel> categoryModel = CategoryModel.categories;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        itemCount: CategoryModel.categories.length,
        itemBuilder: (context, index) {
          CategoryModel currntCategory = categoryModel[index];
          bool isLight =
              Theme.of(context).brightness == AppTheme.lightTheme.brightness;
          bool isSelected = selectedId == currntCategory.id;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: FilterChip(
              label: Row(
                spacing: 8,
                children: [
                  Icon(
                    currntCategory.icon,
                    color: isLight
                        ? isSelected
                              ? AppColors.mainColor
                              : AppColors.lightBackgroundColor
                        : AppColors.lightBackgroundColor,
                  ),
                  Text(
                    currntCategory.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: isLight
                          ? isSelected
                                ? AppColors.mainColor
                                : AppColors.lightBackgroundColor
                          : AppColors.lightBackgroundColor,
                    ),
                  ),
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(46),
              ),
              side: BorderSide(
                color: isLight
                    ? AppColors.lightBackgroundColor
                    : AppColors.mainColor,
              ),
              onSelected: (selected) {
                setState(() {
                  selectedId = currntCategory.id;
                });
              },
              showCheckmark: false,
              selected: isSelected,
              color: WidgetStatePropertyAll(
                isLight
                    ? isSelected
                          ? Colors.transparent
                          : Theme.of(
                              context,
                            ).bottomNavigationBarTheme.backgroundColor
                    : isSelected
                    ? AppColors.mainColor
                    : Theme.of(
                        context,
                      ).bottomNavigationBarTheme.backgroundColor,
              ),
            ),
          );
        },

        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
