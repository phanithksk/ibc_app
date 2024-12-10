import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ibc_app/core/utils/app_color.dart';

class CustomTextFormField extends StatefulWidget {
  final bool? enabled;
  final bool? visible;
  final String? textValidate;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? labeltexts;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final VoidCallback? onpress;
  final String? initialValue;
  final int? maxLines;
  final Color? fillColor;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? border;
  final Widget? suffix;
  final String? hintext;
  final bool? readonly;
  final bool? isValidated;
  final bool? isRequired;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function()? onTap;
  final TextStyle? style;
  final Color? suffixColor;
  final bool obscureText;
  final bool? isCollapsed;
  final EdgeInsetsGeometry? contentPadding;

  final ValueChanged<String>? onChangeds;
  const CustomTextFormField({
    super.key,
    this.enabled = true,
    this.visible,
    this.textValidate,
    this.keyboardType,
    this.inputFormatters,
    this.labeltexts,
    this.controller,
    this.validator,
    this.autovalidateMode,
    this.onpress,
    this.initialValue,
    this.maxLines,
    this.fillColor,
    this.enabledBorder,
    this.focusedBorder,
    this.border,
    this.suffix,
    this.hintext,
    this.readonly = false,
    this.isValidated = false,
    this.isRequired = false,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.style,
    this.suffixColor,
    this.obscureText = false,
    this.isCollapsed,
    this.contentPadding,
    this.onChangeds,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final _localTextEditingController = TextEditingController();
  bool obscure = true;
  void _initialTextField() {
    (widget.controller ?? _localTextEditingController).text =
        widget.initialValue ?? '';
  }

  @override
  void initState() {
    _initialTextField();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        children: [
          TextFormField(
            onTap: () {
              widget.onTap?.call();
            },
            cursorColor: Theme.of(context).hoverColor,
            cursorWidth: 0.8,
            readOnly: widget.readonly!,
            obscureText: widget.obscureText ? obscure : false,
            enabled: widget.enabled,
            style: widget.style ??
                TextStyle(
                  color: Theme.of(context).hoverColor,
                  fontSize: context.isPhone ? 14 : 16,
                  fontFamily: 'EN-REGULAR',
                ),
            inputFormatters: widget.inputFormatters,
            keyboardType: widget.keyboardType,
            onChanged: (v) {
              setState(() {
                widget.isValidated;
              });
              widget.onChangeds?.call(v);
            },
            controller: widget.controller ?? _localTextEditingController,
            validator: widget.validator,
            autovalidateMode: widget.autovalidateMode,
            maxLines: widget.maxLines,
            decoration: InputDecoration(
              isCollapsed: widget.isCollapsed,
              contentPadding: widget.contentPadding ??
                  const EdgeInsets.only(top: 15, bottom: 15, left: 20),
              hintText: widget.hintext,
              suffix: widget.suffix,
              alignLabelWithHint: true,

              // labelText: widget.labeltexts,
              label: widget.labeltexts == null
                  ? null
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.labeltexts ?? '',
                          style: TextStyle(
                            color: const Color(0xff434343).withOpacity(0.3),
                            fontSize: context.isPhone ? 14 : 16,
                            fontFamily: 'EN-REGULAR',
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        widget.isRequired != null && widget.isRequired!
                            ? Text(
                                '*',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: context.isPhone ? 14 : 16,
                                  fontFamily: 'EN-REGULAR',
                                ),
                              )
                            : const Text(''),
                      ],
                    ),
              filled: true,
              fillColor: widget.fillColor ?? Colors.white,
              hintStyle: TextStyle(
                color: const Color(0xff434343).withOpacity(0.3),
                fontSize: context.isPhone ? 16 : 16,
                fontFamily: 'EN-REGULAR',
              ),
              labelStyle: TextStyle(
                color: const Color(0xff434343).withOpacity(0.3),
                fontSize: context.isPhone ? 16 : 16,
                fontFamily: 'EN-REGULAR',
              ),
              border: widget.border,
              errorBorder: errorBorder,
              enabledBorder: widget.isValidated!
                  ? errorBorder
                  : widget.enabledBorder ?? borderStyleTrue,
              focusedBorder: widget.isValidated!
                  ? errorBorder
                  : widget.focusedBorder ?? borderStyleTrue,
              focusedErrorBorder: errorBorder,
              suffixIcon: widget.suffix == null
                  ? (widget.suffixIcon != null
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              obscure = !obscure;
                            });
                          },
                          child: Align(
                            widthFactor: 1,
                            heightFactor: 1,
                            child: obscure
                                ? Icon(
                                    Icons.visibility_off_outlined,
                                    size: context.isPhone ? 20 : 25,
                                    color: widget.suffixColor ??
                                        const Color(0xffAAAAAA),
                                  )
                                : widget.suffixIcon!,
                          ),
                        )
                      : null)
                  : Align(
                      heightFactor: 1,
                      widthFactor: 1,
                      child: widget.suffix,
                    ),
              prefixIcon: widget.prefixIcon != null
                  ? Align(
                      widthFactor: 1,
                      heightFactor: 1,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: Get.height * 0.02,
                          right: Get.height * 0.01,
                        ),
                        child: widget.prefixIcon,
                      ),
                    )
                  : null,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Visibility(
            visible: widget.isValidated ?? false,
            child: Row(
              children: [
                const Icon(
                  CupertinoIcons.exclamationmark_circle_fill,
                  color: Colors.red,
                  size: 12,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  widget.textValidate ?? '',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: context.isPhone ? 12 : 14,
                    fontFamily: 'EN-REGULAR',
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

//! Border Styles
  OutlineInputBorder errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: const BorderSide(
      width: 0.5,
      color: Colors.red,
    ),
  );
  OutlineInputBorder borderStyleTrue = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide(
      width: 0.5,
      color: AppColor().primaryColor,
    ),
  );
}
