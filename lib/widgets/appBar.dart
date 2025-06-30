import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? backButtonColor;
  final Widget? leadingIcon;  // Changed from customLeading to leadingIcon
  final Widget? endIcon;
  final VoidCallback? onBackPressed;
  final double? elevation;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.backgroundColor,
    this.backButtonColor,
    this.leadingIcon,  // Changed from customLeading to leadingIcon
    this.endIcon,
    this.onBackPressed,
    this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      backgroundColor: backgroundColor,
      elevation: elevation,
      leading: leadingIcon ?? (onBackPressed != null || Navigator.canPop(context)
          ? IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: backButtonColor ?? Theme.of(context).appBarTheme.iconTheme?.color,
              ),
              onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
            )
          : null),
      actions: [
        if (endIcon != null) endIcon!,
        ...?actions,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}