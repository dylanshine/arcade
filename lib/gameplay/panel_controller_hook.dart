import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

PanelController usePanelController() {
  return use(_PanelControllerHook());
}

class _PanelControllerHook extends Hook<PanelController> {
  const _PanelControllerHook();

  @override
  _PanelControllerHookState createState() => _PanelControllerHookState();
}

class _PanelControllerHookState
    extends HookState<PanelController, _PanelControllerHook> {
  PanelController _panelController;

  @override
  void initHook() {
    _panelController = PanelController();
  }

  @override
  PanelController build(BuildContext context) => _panelController;
}

extension PanelControllerExtension on PanelController {
  void toggle() {
    isPanelClosed ? open() : close();
  }
}
