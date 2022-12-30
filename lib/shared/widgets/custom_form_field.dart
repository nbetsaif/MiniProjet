import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../styles/colors.dart';

class CustomFormField extends StatefulWidget {
  final bool isEmail;
  final bool isName;
  final bool isPhone;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final String hintText;
  final double? hintFontSize;
  final TextAlign? textAlign;
  final double? width;
  final double? radius;
  final EdgeInsets? margin;
  final bool isPassword;
  bool? enabled;
  late bool isObsecure;

  CustomFormField(
      {super.key,
      this.isEmail = false,
      this.isName = false,
      this.isPhone = false,
      this.enabled =true,
      this.validator,
      this.controller,
      this.textAlign,
      this.hintFontSize,
      this.margin = const EdgeInsets.symmetric(horizontal: 34),
      required this.hintText,
      this.width,
      this.radius,
      this.isPassword = false,
      this.prefixIcon,
      this.suffixIcon}) {
    isObsecure = isPassword;
  }

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    double width10=MediaQuery.of(context).size.width/39.272;
    double height10=MediaQuery.of(context).size.height/76.95;
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: width10, vertical:height10),
          alignment: Alignment.center,
          margin: widget.margin,
          width: widget.width ?? double.infinity,
          height: height10 * 5.6,
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(widget.radius ??height10 * 3),
            color: AppColors.greyColor,
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
              horizontal:width10, vertical: height10*0.6),
          margin: widget.margin,
          child: TextFormField(
            enabled:widget.enabled,
              keyboardType: widget.isEmail == true
                  ? TextInputType.emailAddress
                  : (widget.isName == true
                      ? TextInputType.name
                      : (widget.isPhone == true ? TextInputType.phone : null)),
              validator: widget.validator,
              controller: widget.controller,
              textAlign: widget.textAlign ?? TextAlign.left,
              obscureText: widget.isObsecure,
              decoration: InputDecoration(
                  focusedErrorBorder: InputBorder.none,
                  iconColor: Colors.black,
                  contentPadding: widget.textAlign != null
                      ? EdgeInsets.zero
                      : EdgeInsets.symmetric(
                          vertical:height10 * 1.5),
                  border: InputBorder.none,
                  suffixIcon: widget.isPassword == true
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              widget.isObsecure = !widget.isObsecure;
                            });
                          },
                          child: widget.isObsecure == true
                              ? Icon(
                                  Icons.visibility_off,
                                  color: Colors.black,
                                )
                              : Icon(Icons.visibility,
                                  color:Colors.black),
                        )
                      : null,
                  prefixIcon: widget.prefixIcon != null
                      ? Icon(widget.prefixIcon, color: Colors.black)
                      : null,
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: widget.hintFontSize,
                      fontWeight: widget.hintFontSize != null
                          ? FontWeight.bold
                          : null))),
        )
      ],
    );
  }
}
