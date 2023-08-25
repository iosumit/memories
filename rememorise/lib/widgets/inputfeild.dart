import 'package:flutter/material.dart';
import 'package:rememorise/utils/consts.dart';

class InputField extends StatelessWidget {
  const InputField(
      {Key? key,
      this.controller,
      this.hintText,
      this.validator,
      this.onTap,
      this.onChange,
      this.label,
      this.suffix,
      this.prefix,
      this.isDense,
      this.autovalidateMode,
      this.keyboardType = TextInputType.text,
      this.maxLines = 1,
      this.minLines = 1,
      this.showCounter = false,
      this.contentPadding,
      this.textStyle,
      this.textAlign,
      this.expands = false,
      this.hintStyle,
      this.readOnly = false,
      this.maxlength = 200})
      : super(key: key);
  final TextEditingController? controller;
  final String? hintText;
  final int? maxLines;
  final int? minLines;
  final String? label;
  final TextInputType? keyboardType;
  final int? maxlength;
  final Function(String?)? onChange;
  final bool readOnly;
  final Widget? prefix;
  final Widget? suffix;
  final bool showCounter;
  final bool? isDense;
  final bool? expands;
  final AutovalidateMode? autovalidateMode;
  final Function()? onTap;
  final FormFieldValidator<String>? validator;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      expands: expands!,
      controller: controller,
      textInputAction: TextInputAction.done,
      keyboardType: keyboardType,
      maxLines: maxLines,
      minLines: minLines,
      onChanged: onChange,
      readOnly: readOnly,
      onTap: onTap,
      autovalidateMode: autovalidateMode,
      validator: validator,
      textAlign: textAlign ?? TextAlign.start,
      maxLength: maxlength,
      textAlignVertical: TextAlignVertical.top,
      style: textStyle ?? TextStyle(fontSize: 16, color: Palates.textColor),
      cursorColor: Palates.black,
      decoration: InputDecoration(
        filled: true,
        fillColor: !readOnly ? Palates.white : Palates.border,
        prefixIcon: prefix,
        isDense: isDense,
        suffixIcon: suffix,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        labelText: label,
        hintText: hintText,
        hintStyle:
            hintStyle ?? TextStyle(color: Palates.textLight, fontSize: 16),
        errorStyle: TextStyle(color: Palates.red, fontSize: 0),
        labelStyle: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: Palates.black,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(
            color: Palates.border,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(
            color: Palates.border,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(
            color: Palates.red,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
          borderSide: BorderSide(
            color: Palates.red,
            width: 1,
          ),
        ),
      ),
    );
  }
}
