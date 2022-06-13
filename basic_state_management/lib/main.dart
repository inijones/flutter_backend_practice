import 'package:flutter/material.dart';
import 'package:state_management/plan_provider.dart';
import 'package:state_management/views/plan_creator.dart';

//void main() => runApp(PlanProvider(child: const MasterPlan()));

class MasterPlan extends StatelessWidget {
  const MasterPlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const PlanCreatorScreen(),
    );
  }
}
