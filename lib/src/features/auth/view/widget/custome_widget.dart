import 'package:flutter/material.dart';

import '../../../../core/constant/colors_const.dart';

class CustomField extends StatelessWidget {
  CustomField(
      {super.key,
      required TextEditingController email,
      required this.hint,
      required this.onChange,
      this.onSearch})
      : _email = email;
  final String hint;
  final TextEditingController _email;
  final void Function(String) onChange;
  VoidCallback? onSearch;

  @override
  Widget build(BuildContext context) {
    final obscure = hint == "password" ? true : false;
    return Container(
      margin: const EdgeInsets.all(10),
      height: 50,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: lightBlackColor, borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
          onChanged: onChange,
          obscureText: obscure,
          controller: _email,
          decoration: InputDecoration(
              suffixIcon: onSearch != null
                  ? IconButton(
                      onPressed: onSearch, icon: const Icon(Icons.search))
                  : null,
              hintText: hint,
              enabledBorder: InputBorder.none),
          validator: (value) {
            if (value?.isEmpty ?? false) {
              return "Fil the field";
            }
            return null;
          }),
    );
  }
}
