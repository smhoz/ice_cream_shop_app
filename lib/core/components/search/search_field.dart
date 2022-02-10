import 'package:flutter/material.dart';

import '../../extensions/context_extension.dart';
import '../../utilies/border/border_radius.dart';

class SearchField extends StatelessWidget {
  final Function()? iconOnTap;
  final Function(String value)? onChanged;
  final VoidCallback? onTap;
  final String? hintText;
  final TextEditingController? editingController;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? fillColor;

  const SearchField(
      {Key? key,
      this.iconOnTap,
      this.onTap,
      this.onChanged,
      this.hintText,
      this.editingController,
      this.suffixIcon,
      this.prefixIcon,
      this.fillColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: editingController ?? TextEditingController(),
      onChanged: onChanged,
      onTap: onTap,
      decoration: InputDecoration(
          fillColor: fillColor ?? context.theme.cardColor,
          filled: true,
          prefixIcon: prefixIcon ??
              IconButton(onPressed: iconOnTap, icon: const Icon(Icons.search)),
          suffixIcon: suffixIcon,
          hintText: hintText,
          focusedBorder: _outlineInputBorder(context),
          enabledBorder: _outlineInputBorder(context),
          border: _outlineInputBorder(context)),
    );
  }

  OutlineInputBorder _outlineInputBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: CustomBorderRadius.allLowCircular(),
      borderSide: BorderSide(color: context.theme.cardColor),
    );
  }
}
