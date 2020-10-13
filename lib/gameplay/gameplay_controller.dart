import 'package:flutter/material.dart';

class GameplayController extends StatelessWidget {
  const GameplayController({
    this.isOpen = false,
    @required this.toggle,
    Key key,
  }) : super(key: key);

  final bool isOpen;
  final Function toggle;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade700,
          borderRadius: BorderRadius.all(Radius.circular(60)),
        ),
        child: Row(
          children: [
            _navigationButton(Icons.navigate_before_rounded, 'Previous'),
            Spacer(),
            Expanded(
              flex: 5,
              child: SizedBox(
                height: constraints.maxHeight,
                child: _iconButtons(),
              ),
            ),
            Spacer(),
            _navigationButton(Icons.navigate_next_rounded, 'Next'),
          ],
        ),
      );
    });
  }

  Widget _navigationButton(IconData icon, String label) {
    return SizedBox(
      height: 86.0,
      width: 86.0,
      child: MaterialButton(
        onPressed: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13.0,
              ),
            ),
          ],
        ),
        shape: CircleBorder(),
      ),
    );
  }

  Widget _iconButtons() {
    return Container(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: _iconButton(
                Colors.redAccent,
                Icons.favorite_border,
                Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: _iconButton(
                Colors.white,
                Icons.share,
                Colors.grey,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: _iconButton(
                Colors.blue,
                Icons.home_outlined,
                Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: _infoButton(),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: _expandButton(),
          ),
        ],
      ),
    );
  }

  Widget _expandButton() {
    final icon = isOpen
        ? Icons.keyboard_arrow_down_rounded
        : Icons.keyboard_arrow_up_rounded;

    return LayoutBuilder(builder: (context, constraints) {
      return RawMaterialButton(
        constraints: BoxConstraints(
            maxHeight: 24.0, minWidth: constraints.maxWidth - 72),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Icon(
          icon,
          color: Colors.white,
        ),
        onPressed: toggle,
      );
    });
  }

  Widget _infoButton() {
    return MaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      minWidth: 0,
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        child: Icon(
          Icons.info_outlined,
          size: 16.0,
          color: Colors.white,
        ),
      ),
      shape: CircleBorder(),
      onPressed: () {},
    );
  }

  Widget _iconButton(Color backgroundColor, IconData icon, Color iconColor) {
    return MaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: EdgeInsets.zero,
      minWidth: 0,
      child: SizedBox(
        height: 36.0,
        width: 36.0,
        child: Icon(
          icon,
          size: 16.0,
          color: iconColor,
        ),
      ),
      color: backgroundColor,
      shape: CircleBorder(),
      onPressed: () {},
    );
  }
}
