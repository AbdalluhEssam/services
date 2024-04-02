import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';



class CustomFormAddress extends StatelessWidget {
  final String hinttext;
  final String label;
  final IconData iconData;
  final TextEditingController mycontroller;
  final String? Function(String?) valid;
  final bool isNamber;
  final bool? obscureText;
  final Color? cursorColor;
  final void Function()? onTap;

  const CustomFormAddress({
    Key? key,
    required this.hinttext,
    required this.label,
    required this.iconData,
    required this.mycontroller,
    required this.valid,
    required this.isNamber,
    this.obscureText,
    this.onTap, this.cursorColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        cursorColor:cursorColor?? AppColor.primaryColor,
        style: const TextStyle(color: AppColor.black),
        keyboardType: isNamber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: valid,
        controller: mycontroller,
        obscureText: obscureText == null || obscureText == false ? false : true,
        decoration: InputDecoration(
          fillColor: AppColor.primaryColor,
          focusColor: AppColor.primaryColor,
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          labelStyle:  TextStyle(
              color: cursorColor??  AppColor.primaryColor,
              fontSize: 14,
              fontWeight: FontWeight.bold),
          hintStyle:  TextStyle(
              color:cursorColor??  AppColor.backgroundColor,
              fontSize: 14,
              fontWeight: FontWeight.bold),
          border:  OutlineInputBorder(
              borderSide: BorderSide(color:cursorColor??  AppColor.primaryColor, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(30))),
          enabledBorder:  OutlineInputBorder(
              borderSide: BorderSide(color:cursorColor??  AppColor.primaryColor, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(30))),
          disabledBorder:  OutlineInputBorder(
              borderSide: BorderSide(color:cursorColor??  AppColor.primaryColor, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(30))),
          hintText: hinttext,
          helperStyle: const TextStyle(fontSize: 14),
          floatingLabelBehavior: FloatingLabelBehavior.always,

          label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(label)),
          suffixIcon: InkWell(onTap: onTap, child: Icon(iconData,color:cursorColor?? AppColor.primaryColor,)),
        ),
      ),
    );
  }
}
