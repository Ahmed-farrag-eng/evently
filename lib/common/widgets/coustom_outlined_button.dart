import 'package:evently/common/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CoustomOutlinedButton extends StatelessWidget {
  const CoustomOutlinedButton({super.key, required this.child, this.onPressed});
  final void Function()? onPressed;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 58,
            child: OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: AppColors.mainColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
