import 'package:flutter/material.dart';
import 'package:state_in_flutter/inherited%20widget/eyecolor.dart';

class OurApp extends StatelessWidget {
  const OurApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Our App',
      home: InheritedWidgetOnTop(),
    );
  }
}

class InheritedWidgetOnTop extends StatefulWidget {
  const InheritedWidgetOnTop({Key? key}) : super(key: key);

  @override
  State<InheritedWidgetOnTop> createState() => _InheritedWidgetOnTopState();
}

class _InheritedWidgetOnTopState extends State<InheritedWidgetOnTop> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(30.0),
      children: [
        EyeColor(
          color: Colors.deepOrange,
          child: Builder(builder: (BuildContext context) {
            return GrandParent();
          }),
        ),
        const SizedBox(height: 10),
        ChangingAge(
          age: ChangeAge(age: 25),
          child: Builder(builder: (BuildContext textContext) {
            return UncleClasses();
          }),
        )
      ],
    );
  }
}
