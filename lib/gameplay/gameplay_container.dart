import 'package:flutter/material.dart';

class GameplayContainer extends StatelessWidget {
  const GameplayContainer({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
    );
  }
}
