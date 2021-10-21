import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({this.active = false, this.child, this.onTap});

  final bool active;
  final Widget? child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: child,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: cardColour,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: active ? activeColour : inactiveBorderColour,
          ),
        ),
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({required this.onTap, required this.text});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
        ),
        height: bottomContainerHeight,
        width: double.infinity,
        color: bottomContainerColour,
      ),
    );
  }
}

class RoundIconButton extends StatefulWidget {
  RoundIconButton({Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  final FaIcon icon;
  final VoidCallback onPressed;

  @override
  State<RoundIconButton> createState() => _RoundIconButtonState();
}

class _RoundIconButtonState extends State<RoundIconButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () async {
        _isPressed = true;
        int startTime = DateTime.now().millisecondsSinceEpoch;
        int delay = 150;
        do {
          int now = DateTime.now().millisecondsSinceEpoch;
          widget.onPressed();
          if (now - startTime > 2000) {
            delay = 50;
          } else if (now - startTime > 1000) {
            delay = 100;
          }
          await Future.delayed(Duration(milliseconds: delay));
        } while (_isPressed);
      },
      onLongPressEnd: (_) {
        setState(() => _isPressed = false);
      },
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(roundButtonColour),
          elevation: MaterialStateProperty.all(6.0),
          shape: MaterialStateProperty.all(CircleBorder()),
          fixedSize: MaterialStateProperty.all(Size(56.0, 56.0)),
        ),
        child: widget.icon,
      ),
    );
  }
}

class LabelledIcon extends StatelessWidget {
  const LabelledIcon({required this.label, required this.icon});

  final FaIcon icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        const SizedBox(height: 5.0),
        Text(
          label,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
