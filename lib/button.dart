import 'package:flutter/material.dart';


class Buttons extends StatelessWidget {
  const Buttons({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);
  final String text;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Color(0xFF17ae26),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
class SpecialButton extends StatelessWidget {
  const SpecialButton({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);
  final String text;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Color(0xFF81837f),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
////////////////icon button

class IconsButton extends StatelessWidget {
  const IconsButton({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);
  final String text;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Color(0xFF81837f),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),

      ),
    );
  }
}