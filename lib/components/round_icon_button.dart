import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData child;
  final Function onPressed;

  RoundIconButton({@required this.child, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        child,
        color: Colors.black,
      ),
      elevation: 6,
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      fillColor: Color(0xFFEB1555),
    );
  }
}
