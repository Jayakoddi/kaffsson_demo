import 'package:flutter/material.dart';

import 'coffee_step.dart';
import 'next_button.dart';

class KaffsonContent extends StatelessWidget {
  const KaffsonContent({
    Key? key,
    required this.onNextPressed,
    required this.currentStep,
    required this.onRemovePressed,
    required this.onAddPressed,
    required this.hasAdded,
  }) : super(key: key);

  final VoidCallback onNextPressed;
  final VoidCallback onRemovePressed;
  final VoidCallback onAddPressed;
  final CoffeeStep currentStep;
  final bool hasAdded;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          decoration: BoxDecoration(
            color: Colors.brown[100],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      currentStep.toString(),
                      style: const TextStyle(
                        color: Colors.brown,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Column(
                      children: [
                        Icon(
                          currentStep.icon,
                          size: 150,
                          color: Colors.brown[600],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            currentStep.label,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown[800],
                            ),
                          ),
                        ),

                        if (currentStep == CoffeeStep.collect) ...[
                          const SizedBox(height: 10.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.coffee_rounded,
                                color: Colors.brown,
                                size: 40.0,
                              ),
                              Icon(
                                Icons.coffee_rounded,
                                color: Colors.brown,
                                size: 40.0,
                              ),
                              Icon(
                                Icons.coffee_rounded,
                                color: Colors.brown,
                                size: 40.0,
                              ),
                              Icon(
                                Icons.coffee_rounded,
                                color: Colors.brown,
                                size: 40.0,
                              ),
                              Icon(
                                Icons.coffee_rounded,
                                color: Colors.brown,
                                size: 40.0,
                              ),
                              Icon(
                                Icons.coffee_rounded,
                                color: hasAdded ? Colors.brown : Colors.grey,
                                size: 40.0,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0,),
                          Row(
                            children: [
                              const SizedBox(width: 10.0),
                              IconButton(
                                onPressed: !hasAdded ? null : onRemovePressed,
                                icon: const Icon(
                                  Icons.remove_circle,
                                  size: 44.0,
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: hasAdded ? null : onAddPressed,
                                icon: const Icon(
                                  Icons.add_circle,
                                  size: 44.0,
                                ),
                              ),
                              const SizedBox(width: 10.0),
                            ],
                          ),
                        ],

                        // How do i call the function addCupsButton based on a condition ?????
                        /*
          if(activeStep == 1)   //want this for only when other user want a cup of coffee
          {
          addCupsButton(),
          }*/
                      ],
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    NextButton(
                      onPressed: onNextPressed,
                      text: currentStep != CoffeeStep.finish ? "Next" : "Done",
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
    ;
  }
}
