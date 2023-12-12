import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.iconTrailing,
    this.height,
    this.width,
    this.withIcon = true,
    required this.backgroundColor,
    required this.outlineColor,
    required this.titleColor,
    this.radius = 10,
  }) : super(key: key);

  final String title;
  final VoidCallback? onTap;
  final Widget? iconTrailing;
  final double? height;
  final double? width;
  final bool withIcon;
  final Color backgroundColor;
  final Color outlineColor;
  final Color titleColor;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      elevation: 1,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 50,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(color: outlineColor)),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(radius),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(radius),
            child: Row(
              mainAxisAlignment: withIcon
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              children: [
                if (withIcon)
                  const Flexible(
                    child: SizedBox(
                      width: 20,
                    ),
                  ),
                Flexible(
                  flex: 5,
                  child: Text(
                    title,
                    style: TextStyle(
                        color: titleColor,
                        fontSize: 12,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
