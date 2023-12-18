import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? icon;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final double? borderRadius;
  final int? maxLines;
  final int? minLines;
  final bool? readOnly;
  const TextInput({
    Key? key,
    required this.controller,
    required this.hintText,
    this.icon,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.borderRadius,
    this.maxLines,
    this.minLines,
    this.readOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType ?? TextInputType.emailAddress,
      textInputAction: textInputAction ?? TextInputAction.next,
      controller: controller,
      onSaved: (email) {},
      maxLines: maxLines,
      readOnly: readOnly ?? false,
      minLines: minLines,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 30)),
          borderSide: BorderSide(
            color: Colors.red.withOpacity(0.1),
            style: BorderStyle.solid,
          ),
        ),
        prefixIcon: icon != null
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  icon,
                  size: 22,
                ),
              )
            : null,
      ),
    );
  }
}
