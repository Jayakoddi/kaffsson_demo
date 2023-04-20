import 'package:flutter/material.dart';

enum CoffeeStep {
  start(0, Icons.coffee_maker_outlined),
  collect(1, Icons.coffee_outlined),
  brewing(2, Icons.coffee_maker_sharp),
  finish(3, Icons.coffee_rounded);

  const CoffeeStep(this.step, this.icon);

  final int step;
  final IconData icon;

  String get label {
    switch (this) {
      case CoffeeStep.start:
        return "Making a Moccamaster Pot!";
      case CoffeeStep.collect:
        return "Would like a cup of coffee?";
      case CoffeeStep.brewing:
        return "In 10-15 minutes coffee will be ready!";
      case CoffeeStep.finish:
        return "Come! Enjoy your hot cup of coffee!";
    }
  }

  @override
  String toString() {
    switch (this) {
      case CoffeeStep.start:
        return "Starting";
      case CoffeeStep.collect:
        return "Collecting";
      case CoffeeStep.brewing:
        return "Brewing";
      case CoffeeStep.finish:
        return "Finished";
    }
  }
}
