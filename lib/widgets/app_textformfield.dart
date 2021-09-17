import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final String? Function(String?)? validator;
  final Function()? onPressed;
  final String? hintText;
  final String? initialValue;
  final bool readOnly;
  final bool calendario;
  final bool senha;
  final bool enabled;
  final double minWidth;
  final double maxWidth;
  final IconData? iconData;
  final TextEditingController? controller;
  final bool obscureText;

  AppTextFormField(
      this.hintText, {
        this.controller,
        this.onPressed,
        this.iconData,
        this.validator,
        this.obscureText = false,
        this.readOnly = false,
        this.enabled = true,
        this.minWidth = 200,
        this.maxWidth = 250,
        this.calendario = false,
        this.senha = false,
        this.initialValue
      });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
      BoxConstraints(minWidth: minWidth, maxWidth: maxWidth, maxHeight: 50),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        child: Stack(
          children: [
            TextFormField(
                onChanged:  (text) => "Nome",
                obscureText: obscureText,
                controller: controller,
                validator: validator,
                readOnly: readOnly,
                enabled: enabled,
                decoration: InputDecoration(
                  errorStyle: const TextStyle(color: Colors.redAccent),
                  focusColor: Colors.blue,
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  hintText: hintText,
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide.none),
                )),
            Visibility(
              visible: iconData != null,
              child: Positioned(
                right: 5,
                child: IconButton(
                    onPressed: onPressed,
                    icon: Icon(
                      iconData,
                      color: Colors.blue,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
