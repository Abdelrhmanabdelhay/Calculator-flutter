import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
final double w;
final double h;
final Color colorcontainer;
final Color colortxt;

final VoidCallback? onPressed;
final String x;
MyButton({
  super.key,
  required this.x,
  required this.w,
  required this.h,
required this.colorcontainer,
  required this.colortxt,

  this.onPressed
});

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.w, // Adjust the width as needed
      height: widget.h, // Adjust the height as needed
      child: ElevatedButton(
        onPressed:widget.onPressed,
        style: ElevatedButton.styleFrom(
          primary: widget.colorcontainer,
          padding: EdgeInsets.all(6.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),

          ),
        ),
        child: Text(
          widget.x as String,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 32.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.0,
            color: widget.colortxt, // Adjust the color as needed
          ),
        ),
      ),
    );
  }
}
