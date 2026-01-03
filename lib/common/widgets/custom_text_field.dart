import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.title,
    this.hintText,
    this.prefixIconPath,
    this.controller,
    this.validator,
    this.isPassword = false,
  });

  final String? title, hintText, prefixIconPath;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isPassword;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isPassword = widget.isPassword;
  bool isTaped = false;
  InputBorder _getBorderStyle(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Theme.of(context).splashColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              widget.title!,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: isPassword,
          controller: widget.controller,
          validator: widget.validator,
          decoration: InputDecoration(
            border: _getBorderStyle(context),
            enabledBorder: _getBorderStyle(context),
            focusedBorder: _getBorderStyle(context).copyWith(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
            ),
            errorBorder: _getBorderStyle(
              context,
            ).copyWith(borderSide: BorderSide(color: Colors.red)),
            hintText: widget.hintText,
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isTaped = !isTaped;
                        isPassword = !isPassword;
                      });
                    },
                    icon: isTaped
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                  )
                : null,
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
}
