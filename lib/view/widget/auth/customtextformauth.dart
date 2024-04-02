import 'package:flutter/material.dart';

class CustomFormAuth extends StatelessWidget {
  final String hinttext;
  final String label;
  final IconData iconData;
  final TextEditingController mycontroller;
  final String? Function(String?) valid;
  final String? Function(String)? onChanged;
  final bool isNamber;
  final bool? obscureText;
  final void Function()? onTap;

  const CustomFormAuth({
    Key? key,
    required this.hinttext,
    required this.label,
    required this.iconData,
    required this.mycontroller,
    required this.valid,
    required this.isNamber,
    this.obscureText,
    this.onTap,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        keyboardType: isNamber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: valid,
        onChanged: onChanged,
        controller: mycontroller,
        obscureText: obscureText == null || obscureText == false ? false : true,
        decoration: InputDecoration(
          hintText: hinttext,
          helperStyle: const TextStyle(fontSize: 14),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(label)),
          suffixIcon: InkWell(onTap: onTap, child: Icon(iconData)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
        ),
      ),
    );
  }
}
