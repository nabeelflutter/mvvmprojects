// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mvvmpattern/res/components/appcolors.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {Key? key,
      this.loading = false,
      required this.width,
      required this.height,
      required this.press,
      required this.title})
      : super(key: key);
  double height;
  double width;
  String title;
  VoidCallback press;
  bool loading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: AppColors.green),
          child: Center(
            child: loading ? const CircularProgressIndicator(color: Colors.white,) : Text(title),
          ),
        ),
      ),
    );
  }
}
