import 'package:arcade/gameplay/gameplay_container.dart';
import 'package:arcade/gameplay/gameplay_controller.dart';
import 'package:arcade/gameplay/gameplay_webview.dart';
import 'package:arcade/gameplay/panel_controller_hook.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class GameplayPage extends HookWidget {
  const GameplayPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final panelController = usePanelController();
    final isPanelOpen = useState(false);

    return Scaffold(
      body: SlidingUpPanel(
        controller: panelController,
        color: Colors.transparent,
        minHeight: 24.0,
        maxHeight: 102.0,
        onPanelOpened: () {
          isPanelOpen.value = true;
        },
        onPanelClosed: () {
          isPanelOpen.value = false;
        },
        panel: GameplayController(
          isOpen: isPanelOpen.value,
          toggle: panelController.toggle,
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 32.0),
          child: GameplayContainer(
            child: GameplayWebview(
                "https://html5.gamedistribution.com/6c5fd1a4f3544538a6bbdfdc1c7bd507/"),
          ),
        ),
      ),
    );
  }
}
