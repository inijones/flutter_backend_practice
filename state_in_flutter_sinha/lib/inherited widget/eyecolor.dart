import 'package:flutter/material.dart';

class EyeColor extends InheritedWidget {
  final Color color;
  const EyeColor({
    Key? key,
    required this.color,
    required Widget child,
  }) : super(key: key, child: child);

  static EyeColor of(BuildContext context) {
    final EyeColor? result =
        context.dependOnInheritedWidgetOfExactType<EyeColor>();
    assert(result != null, 'No EyeColor found in this context');
    return result!;
  }

  @override
  bool updateShouldNotify(EyeColor old) => color != old.color;
}

class ChangingAge extends InheritedWidget {
  final ChangeAge age;
  ChangingAge({
    Key? key,
    required this.age,
    required Widget child,
  }) : super(key: key, child: child);

  static ChangingAge of(BuildContext context) {
    final ChangingAge? result =
        context.dependOnInheritedWidgetOfExactType<ChangingAge>();
    assert(result != null, '');
    return result!;
  }

  @override
  bool updateShouldNotify(ChangingAge old) => age != old.age;
}

class ChangeAge {
  int age;
  ChangeAge({required this.age});

  void changeAge() {
    age += 5;
  }
}

class GrandParent extends StatelessWidget {
  const GrandParent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eyeColor = EyeColor.of(context).color;
    return Column(
      children: [
        Text(
          "I am the Grandparent, although I am a Ghost now! I had two sons.",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: eyeColor),
        ),
        const SizedBox(height: 10),
        FatherClass(),
      ],
    );
  }
}

class FatherClass extends StatelessWidget {
  const FatherClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "I am the Father, I have two brothers.",
          style: TextStyle(
            color: EyeColor.of(context).color,
          ),
        ),
      ],
    );
  }
}

class UncleClasses extends StatelessWidget {
  const UncleClasses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Text(
            'This is a list of Uncles with different states.',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          FirstUncleClass(),
          SizedBox(height: 5),
          UncleClass()
        ],
      ),
    );
  }
}

class FirstUncleClass extends StatefulWidget {
  const FirstUncleClass({Key? key}) : super(key: key);

  @override
  State<FirstUncleClass> createState() => _FirstUncleClassState();
}

class _FirstUncleClassState extends State<FirstUncleClass> {
  var firstUncleAge = ChangeAge(age: 35);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "I am First Uncle, ${firstUncleAge.age} years old, change my age by add button below.",
          style: const TextStyle(
            fontSize: 30,
            color: Colors.lightGreenAccent,
            backgroundColor: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        FloatingActionButton(
          onPressed: () {
            setState(() {
              firstUncleAge.changeAge();
            });
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.blue,
        )
      ],
    );
  }
}

class UncleClass extends StatefulWidget {
  const UncleClass({Key? key}) : super(key: key);

  @override
  State<UncleClass> createState() => _UncleClassState();
}

class _UncleClassState extends State<UncleClass> {
  @override
  Widget build(BuildContext context) {
    return Column(

    );
  }
}
