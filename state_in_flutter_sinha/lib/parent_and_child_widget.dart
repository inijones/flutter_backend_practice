import 'package:flutter/material.dart';

class ParentWidget extends StatefulWidget {
  const ParentWidget({Key? key}) : super(key: key);

  @override
  State<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  //typedef ValueChanged<T> = void Function(T value);
  bool _inActive = true;

  // Implement _manageStateForChildWidget, called when the box is tapped
  void _manageStateForChildWidget(bool newValue) {
    setState(() {
      _inActive = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ChildWidget(
          inActive: _inActive,
          notifyParent: _manageStateForChildWidget,
        ),
      ),
    );
  }
}

class ChildWidget extends StatelessWidget {
  final bool inActive;

  final ValueChanged<bool> notifyParent;

  void manageState() {
    notifyParent(!inActive);
  }

  const ChildWidget(
      {Key? key, required this.inActive, required this.notifyParent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: manageState,
      child: Container(
        width: 250,
        height: 250,
        decoration: BoxDecoration(
          color: inActive ? Colors.red : Colors.green,
        ),
        child: Center(
          child: Text(
            inActive ? "Inactive" : "Active",
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
