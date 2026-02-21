
import 'package:flutter/material.dart';
import 'package:news/utitis/context_extentions.dart';

class CustomTextField extends StatelessWidget {
  bool ? filled;
  Widget ? prefix;
  String text;
  void Function(String?)? onChanging;
  CustomTextField({super.key,this.onChanging,this.filled,this.prefix,required this.text});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = context.watchTheme.isDarkMode();
    final textTheme = context.theme.textTheme;
    final theme = context.theme;
    return TextFormField(
      onChanged: onChanging,
    
      decoration: InputDecoration( 
        contentPadding: EdgeInsets.symmetric(
          vertical: context.h*0.02,
          horizontal: context.w*0.02
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: theme.splashColor,
              width: 2
            )
        ),
        prefixIcon: prefix,
        suffixIcon: IconButton(
          onPressed: () {
            Navigator.pop(context);
          }, 
          icon: Icon(
            Icons.close,
            color: context.theme.splashColor,
          ),
        ),
        hintText: text,
        hintStyle: textTheme.bodyMedium,
      ),
      
    );
  }
}