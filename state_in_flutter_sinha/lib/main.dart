import 'package:flutter/material.dart';
import 'package:state_in_flutter/own_state_managing_widget.dart';
import 'package:state_in_flutter/parent_and_child_widget.dart';
import 'package:state_in_flutter/question_and_answer.dart';

// void main() {
//   runApp(OurApp());
// }

class OurApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Our App',
      debugShowCheckedModeBanner: false,
      home: ParentWidget(),
    );
  }
}

class ACenterClass extends StatefulWidget {
  @override
  State<ACenterClass> createState() => _ACenterClassState();
}

class _ACenterClassState extends State<ACenterClass> {
  var pressRemoteCount = 0;

  void pressRemote() {
    setState(() {
      pressRemoteCount = pressRemoteCount + 1;
    });
    print(pressRemoteCount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: 350,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(
              color: Colors.deepOrange,
              width: 2.0,
              style: BorderStyle.solid,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(40.0)),
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 20.0,
                spreadRadius: 20,
              ),
            ],
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.red, Colors.white],
            ),
          ),
          child: Column(
            children: [
              Text(
                "$pressRemoteCount",
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: pressRemote,
                child: const Text(
                  'Press Button',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
