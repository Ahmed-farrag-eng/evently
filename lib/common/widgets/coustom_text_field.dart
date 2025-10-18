import 'package:evently/common/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoustomTextField extends StatefulWidget {
  const CoustomTextField({
    super.key,
    this.title,
    this.hintText,
    this.prefixIconPath,
    this.controller,
    this.validator,
  });
  final String? title, hintText, prefixIconPath;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  State<CoustomTextField> createState() => _CoustomTextFieldState();
}

class _CoustomTextFieldState extends State<CoustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.title != null)
          Text(widget.title!, style: Theme.of(context).textTheme.titleMedium),

        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          decoration: InputDecoration(
            border: _getBorderStyle(),
            enabledBorder: _getBorderStyle(),
            focusedBorder: _getBorderStyle(),
            focusedErrorBorder: _getBorderStyle(),
            errorBorder: _getBorderStyle().copyWith(
              borderSide: BorderSide(color: AppColors.errorColor),
            ),
            disabledBorder: _getBorderStyle(),
            hintText: widget.hintText,
            hintStyle: Theme.of(context).textTheme.bodyLarge,
            prefixIcon: widget.prefixIconPath != null
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SvgPicture.asset(
                      widget.prefixIconPath!,
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).hintColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }

  InputBorder _getBorderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Theme.of(context).splashColor),
    );
  }
}
