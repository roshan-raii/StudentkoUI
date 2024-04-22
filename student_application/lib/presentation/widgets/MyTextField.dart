import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? initialValue;
  final TextEditingController? controller;
  final bool obscureText;
  final bool readOnly;
  final void Function(String?)? onChanged;
  final void Function()? onEditingComplete;
  final void Function(String?)? onSaved;
  final int? maxLength;
  final int? maxLines;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final void Function()? onTap;
  final Widget? widget;
  final int? minLines;
  final FocusNode? focusNode;

  MyTextField({
    Key? key,
    this.label,
    this.minLines,
    this.hint,
    this.initialValue,
    this.controller,
    this.obscureText = false,
    this.readOnly = false,
    this.onChanged,
    this.onEditingComplete,
    this.onSaved,
    this.maxLength,
    this.maxLines = 1,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.widget,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 235, 235, 235)),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            // borderSide: BorderSide(color: Color.fromARGB(255, 235, 235, 235)),
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(15),
          ),
          filled: true,
          fillColor: Color.fromARGB(255, 224, 230, 243),
          labelText: label,
          hintText: hint,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
        minLines: minLines,
        initialValue: initialValue,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        onSaved: onSaved,
        maxLength: maxLength,
        maxLines: maxLines,
        readOnly: readOnly,
        obscureText: obscureText,
        inputFormatters: [],
        // inputFormatters: [
        //   // TextInputFormatter.withFunction((oldValue, newValue) => null)
        // ],
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        focusNode: focusNode,
        onTap: () {
          onTap;
        },
      ),
    );
  }
}
