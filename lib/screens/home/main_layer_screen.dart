import 'package:evently/common/theme/app_assets.dart';
import 'package:evently/common/theme/app_colors.dart';
import 'package:evently/screens/home/home_tab/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainLayerScreen extends StatefulWidget {
  const MainLayerScreen({super.key});
  static const String routeName = "/mainLayerScreen";

  @override
  State<MainLayerScreen> createState() => _MainLayerScreenState();
}

class _MainLayerScreenState extends State<MainLayerScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    Home(),
    Container(color: Colors.blueGrey),
    Container(color: Colors.cyan),
    Container(color: Colors.amber),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: Transform.translate(
        offset: Offset(0, 5),
        child: FloatingActionButton(
          onPressed: () {},
          shape: CircleBorder(),
          backgroundColor: Theme.of(
            context,
          ).bottomNavigationBarTheme.backgroundColor,
          child: Icon(
            Icons.add,
            color: AppColors.lightBackgroundColor,
            size: 40,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        notchMargin: 10,
        clipBehavior: Clip.hardEdge,
        shape: AutomaticNotchedShape(
          ContinuousRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(0),
          ),
          CircleBorder(side: BorderSide.none, eccentricity: 0.8),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },

          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAssets.homeOutlinedSvg),
              activeIcon: SvgPicture.asset(AppAssets.homeFilledSvg),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAssets.mapOutlinedSvg),
              activeIcon: SvgPicture.asset(AppAssets.mapFilledSvg),
              label: "Map",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAssets.heartOutlined),
              activeIcon: SvgPicture.asset(AppAssets.heartFilledSvg),
              label: "Fav",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAssets.userOutlinedSvg),
              activeIcon: SvgPicture.asset(AppAssets.userFilledSvg),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
