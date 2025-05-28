import 'package:flutter/material.dart';

class FormContainerWidget extends StatefulWidget {
  final TextEditingController? controller;
  final Key? fieldKey;
  final bool? isPasswordField;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? inputType;

  const FormContainerWidget({
    super.key,
    this.controller,
    this.fieldKey,
    this.isPasswordField,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.inputType,
  });

  @override
  State<FormContainerWidget> createState() => _FormContainerWidgetState();
}

class _FormContainerWidgetState extends State<FormContainerWidget> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.45),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: widget.controller,
        key: widget.fieldKey,
        decoration: InputDecoration(
          labelText: widget.labelText,
          filled: true,
          fillColor: Colors.grey[100],
          prefixIcon:
              widget.isPasswordField == true
                  ? Icon(Icons.lock_outline)
                  : Icon(Icons.person_outline),
          suffixIcon:
              widget.isPasswordField == true
                  ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: _toggleObscureText,
                  )
                  : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        ),
        obscureText: widget.isPasswordField == true ? _obscureText : false,
        onSaved: widget.onSaved,
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldSubmitted,
        keyboardType: widget.inputType,
      ),
    );
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
