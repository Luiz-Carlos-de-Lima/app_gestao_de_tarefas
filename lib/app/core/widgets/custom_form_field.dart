import 'package:app_gestao_de_tarefas/app/core/ui/theme_extension.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  final String labelText;
  final bool obscureText;
  final bool enableSwapObscure;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;

  const CustomFormField({super.key, required this.labelText, this.obscureText = false, this.enableSwapObscure = false, required this.controller, this.validator, this.focusNode});

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  final obscure = ValueNotifier<bool>(false);

  @override
  void initState() {
    obscure.value = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: obscure,
      builder: (context, _) {
        return SizedBox(
          child: TextFormField(
            expands: false,
            controller: widget.controller,
            obscureText: obscure.value,
            focusNode: widget.focusNode,
            style: TextStyle(color: context.onBackground),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(15),
              isCollapsed: true,
              isDense: true,
              hintText: widget.labelText,
              suffixIcon: widget.enableSwapObscure
                  ? IconButton(
                      onPressed: () {
                        obscure.value = !obscure.value;
                      },
                      icon: Icon(
                        obscure.value ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                      ),
                    )
                  : null,
              hintStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 2),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 2, color: context.errorColor),
              ),
            ),
            validator: widget.validator,
          ),
        );
      },
    );
  }
}
