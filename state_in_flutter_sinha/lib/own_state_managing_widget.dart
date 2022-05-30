import 'package:flutter/material.dart';

class OwnStateManagingState extends StatefulWidget {
  const OwnStateManagingState({Key? key}) : super(key: key);

  @override
  State<OwnStateManagingState> createState() => _OwnStateManagingStateState();
}

class _OwnStateManagingStateState extends State<OwnStateManagingState> {
  // let us define the boolean value first
  bool _stateChanged = false;

  // let us create a function that will define the setState() method

  void _changeState() {
    setState(() {
      _stateChanged = !_stateChanged;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          // We'll use GestureDetector so that we can tap a box that will turn green
          // as the state is changed
          onTap: _changeState,
          child: Container(
            width: 350,
            height: 350,
            decoration:
                BoxDecoration(color: _stateChanged ? Colors.green : Colors.red),
            child: Center(
              child: Text(
                _stateChanged ? 'State Changed' : 'State Unchanged',
                style: const TextStyle(
                  fontSize: 35.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
