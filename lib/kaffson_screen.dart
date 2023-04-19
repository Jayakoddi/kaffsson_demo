import 'package:flutter/material.dart';

import 'package:im_stepper/stepper.dart';

import 'coffee_step.dart';
import 'kaffson_content.dart';

class KaffssonScreen extends StatefulWidget {
  const KaffssonScreen({Key? key}) : super(key: key);

  @override
  State<KaffssonScreen> createState() => _KaffssonScreenState();
}

class _KaffssonScreenState extends State<KaffssonScreen> {
  CoffeeStep currentStep = CoffeeStep.start;

  int count = 0;
  bool _hasAdded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kaffsson Demo'),
        backgroundColor: Colors.brown[900],
        foregroundColor: Colors.white,
      ),
      body: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.brown[200],
            ),
            child: IconStepper(
              enableStepTapping: false,
              steppingEnabled: true,
              stepRadius: 25.0,
              stepColor: Colors.brown[500],
              activeStepColor: Colors.brown[900],
              activeStepBorderColor: Colors.brown[900],
              activeStepBorderWidth: 4.0,
              lineColor: Colors.brown[800],
              lineLength: 80.0,
              lineDotRadius: 1.5,
              direction: Axis.vertical,
              icons: CoffeeStep.values
                  .map(
                    (coffeeStep) => Icon(
                      coffeeStep.icon,
                      color: Colors.white,
                    ),
                  )
                  .toList(),
              activeStep: currentStep.step,
              // onStepReached: (value) {
              //   setState(() {
              //     // activeStep = value;
              //   });
              // },
            ),
          ),

          KaffsonContent(
            onNextPressed: _onNextPressed,
            currentStep: currentStep,
            onRemovePressed: () => _onToggleHasAdded(false),
            onAddPressed: () => _onToggleHasAdded(true),
            hasAdded: _hasAdded,
          ),
          // stepContent(),
        ],
      ),
    );
  }

  Widget addCupsButton() {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.add),
          iconSize: 30,
          color: Colors.brown[700],
          onPressed: () {
            if (count < 6) {
              // max 6 cups
              setState(() {
                count++;
              });
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            '$count',
            style: const TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.remove),
          iconSize: 30,
          color: Colors.brown[700],
          onPressed: () {
            if (count > 1) {
              // at least 1 cup of coffee
              setState(() {
                count--;
              });
            }
          },
        ),
      ],
    );
  }

  void _onNextPressed() {
    switch (currentStep) {
      case CoffeeStep.start:
        currentStep = CoffeeStep.collect;
        break;
      case CoffeeStep.collect:
        currentStep = CoffeeStep.brewing;
        break;
      case CoffeeStep.brewing:
        currentStep = CoffeeStep.finish;
        break;
      case CoffeeStep.finish:
        currentStep = CoffeeStep.start;
    }
    setState(() {});
  }

  void _onToggleHasAdded(bool hasAdded) {
    setState(() {
      _hasAdded = hasAdded;
    });
  }
}
