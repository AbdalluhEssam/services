import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

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


class CustomFormAuthDate extends StatelessWidget {
  final String hinttext;
  final String label;
  final IconData iconData;
  final TextEditingController mycontroller;
  final String? Function(String?) valid;
  final bool isNamber;
  final bool? obscureText;
  final void Function()? onTap;
  final void Function()? onTapFull;
  final Color? color;

  const CustomFormAuthDate({
    Key? key,
    required this.hinttext,
    required this.label,
    required this.iconData,
    required this.mycontroller,
    required this.valid,
    required this.isNamber,
    this.obscureText,
    this.onTap,
    this.onTapFull,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTapFull,
      style: const TextStyle(color: AppColor.primaryColor),
      keyboardType: isNamber
          ? const TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
      validator: valid,
      controller: mycontroller,
      obscureText: obscureText == null || obscureText == false ? false : true,
      decoration: InputDecoration(
        fillColor: color ?? AppColor.backgroundColor,
        filled: true,
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        labelStyle: const TextStyle(
            color: AppColor.primaryColor, fontSize: 14, fontWeight: FontWeight.bold),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.backgroundColor, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(50))),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.backgroundColor, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(50))),
        disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.backgroundColor, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(50))),
        label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(label,)),
        prefixIcon: Icon(
          iconData,
          color: AppColor.primaryColor,
        ),
        suffixIcon: obscureText != null
            ? InkWell(onTap: onTap, child: Icon(iconData))
            : null,
      ),
    );
  }
}

class CustomFormAdd extends StatelessWidget {
  final String hinttext;
  final String label;
  final IconData iconData;
  final TextEditingController mycontroller;
  final String? Function(String?) valid;
  final bool isNamber;
  final bool? obscureText;
  final void Function()? onTap;
  final void Function()? onTapFull;
  final String? Function(String)? onChanged;

  final Color? color;

  const CustomFormAdd({
    Key? key,
    required this.hinttext,
    required this.label,
    required this.iconData,
    required this.mycontroller,
    required this.valid,
    required this.isNamber,
    this.obscureText,
    this.onTap,
    this.onTapFull,
    this.color, this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTapFull,
      style: const TextStyle(color: AppColor.primaryColor),
      keyboardType: isNamber
          ? const TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
      onChanged: onChanged,
      validator: valid,
      controller: mycontroller,
      obscureText: obscureText == null || obscureText == false ? false : true,
      decoration: InputDecoration(
        fillColor: color ?? AppColor.primaryColor.withOpacity(0.3),
        filled: true,
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        labelStyle: const TextStyle(
            color: AppColor.gray, fontSize: 14, fontWeight: FontWeight.bold),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.backgroundColor, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(50))),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.backgroundColor, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(50))),
        disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.backgroundColor, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(50))),
        label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(label)),
        prefixIcon: Icon(
          iconData,
          color: AppColor.black.withOpacity(0.5),
        ),
        suffixIcon: obscureText != null
            ? InkWell(onTap: onTap, child: Icon(iconData))
            : null,
      ),
    );
  }
}


