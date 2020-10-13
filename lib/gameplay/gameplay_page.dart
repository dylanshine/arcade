import 'package:arcade/gameplay/gameplay_container.dart';
import 'package:arcade/gameplay/gameplay_controller.dart';
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
      body: SafeArea(
        child: SlidingUpPanel(
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
            toggle: () {
              panelController.isPanelClosed
                  ? panelController.open()
                  : panelController.close();
            },
          ),
          body: Padding(
            padding: const EdgeInsets.only(bottom: 52.0),
            child: GameplayContainer(child: Container(color: Colors.black)),
          ),
        ),
      ),
    );
  }
}
