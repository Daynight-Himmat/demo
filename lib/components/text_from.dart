import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ITTextField extends StatelessWidget {
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final TextCapitalization? capitalization;
  final bool? obscure;
  final bool? readOnly;
  final bool? autofocus;
  final VoidCallback? voidCallback;
  final int? maxLength;
  final int? maxLine;
  final int? minLine;
  final EdgeInsets? contentPadding;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final TextEditingController? controller;
  final Color? color;
  final InputBorder? border;
  final InputBorder? enableBorder;
  final InputBorder? focusBorder;
  final InputBorder? disableBorder;
  final void Function(String)? onFieldFocusChange;
  final TextAlign? align;
  final void Function()? onSubmit;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormat;

  const ITTextField({
    Key? key,
    this.align,
    this.voidCallback,
    this.color,
    this.hintText,
    this.obscure,
    this.maxLength,
    this.inputType,
    this.controller,
    this.focusNode,
    this.contentPadding,
    this.labelText,
    this.maxLine,
    this.suffixIcon,
    this.prefixIcon,
    this.border,
    this.enableBorder,
    this.focusBorder,
    this.disableBorder,
    this.readOnly,
    this.onFieldFocusChange,
    this.nextNode,
    this.autofocus,
    this.onSubmit,
    this.inputAction,
    this.minLine,
    this.onChanged,
    this.capitalization,
    this.inputFormat,
    this.errorText,
    this.validator,
  }) : super(key: key);

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: TextFormField(
        inputFormatters: inputFormat,
        autofocus: autofocus ?? false,
        onTap: voidCallback,
        controller: controller,
        maxLength: maxLength,
        keyboardType: inputType,
        textInputAction: inputAction,
        textCapitalization: capitalization ?? TextCapitalization.none,
        obscureText: obscure ?? false,
        readOnly: readOnly ?? false,
        focusNode: focusNode,
        textAlign: align ?? TextAlign.left,
        style: Theme.of(context).textTheme.labelSmall,
        maxLines: maxLine ?? 1,
        minLines: minLine ?? 1,
        onChanged: onChanged,
        onFieldSubmitted: (term) {
          _fieldFocusChange(
              context, focusNode ?? FocusNode(), nextNode ?? FocusNode());
        },
        validator: validator,
        decoration: InputDecoration(
          counterText: "",
          hintText: hintText,
          labelText: labelText,
          labelStyle: Theme.of(context).textTheme.labelSmall,
          contentPadding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          errorText: errorText,
          errorStyle: const TextStyle(
            fontSize: 13,
            color: Colors.red,
            fontWeight: FontWeight.w400
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: border,
          enabledBorder: enableBorder,
          focusedBorder: focusBorder,
          disabledBorder: disableBorder,
        ),
      ),
    );
  }
}
