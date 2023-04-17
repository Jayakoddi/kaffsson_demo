import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: KaffssonStepper(),
    );
  }
}

class KaffssonStepper extends StatefulWidget {
  const KaffssonStepper({Key? key}) : super(key: key);

  @override
  State<KaffssonStepper> createState() => _KaffssonStepperState();
}

class _KaffssonStepperState extends State<KaffssonStepper> {
  int activeStep = 0;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Kaffsson Demo'),
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
                steppingEnabled: true,
                stepRadius: 25.0,
                stepColor: Colors.brown[500],
                activeStepColor: Colors.brown[700],
                activeStepBorderColor: Colors.brown[900],
                activeStepBorderWidth: 4.0,
                lineColor: Colors.brown[800],
                lineLength: 80.0,
                lineDotRadius: 1.5,
                direction: Axis.vertical,
                icons: const [
                  Icon(
                    Icons.coffee_maker_outlined,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.coffee_outlined,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.coffee_maker_sharp,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.coffee_rounded,
                    color: Colors.white,
                  ),
                ],
                activeStep: activeStep,
                onStepReached: (value) {
                  setState(() {
                    activeStep = value;
                  });
                },
              ),
            ),

            //Call to method stepContent()
            stepContent(),
          ],
        ));
  }

  Widget stepContent() {
    return Expanded(
      child: Container(
          decoration: BoxDecoration(
            color: Colors.brown[100],
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Title or Header
                    const Text(
                      'Kaffsson',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),

                    //Call to method stepDetail()
                    stepDetail(),

                    const SizedBox(
                      height: 100,
                    ),

                    //call to method nextButton()
                    nextButton(),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Widget nextButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
      ),
      onPressed: () {
        if (activeStep < 4) {
          setState(() {
            activeStep++;
          });
        } else {
          setState(() {
            activeStep = 0;
          });
        }
      },
      child: Text(
        (activeStep < 3) ? 'NEXT' : 'DONE',
        style: const TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget stepDetail() {
    switch (activeStep) {
      case 0:
        return moreDetail(
            Icons.coffee_maker_outlined, 'Making a Moccamaster Pot!');
      case 1:
        return moreDetail(Icons.coffee_outlined, 'Would like a cup of coffee?');
      case 2:
        return moreDetail(
            Icons.coffee_maker, 'In 10-15 minutes coffee will be ready!');
      case 3:
        return moreDetail(Icons.coffee, 'Come! Enjoy your hot cup of coffee!');
      default:
        return Container(
          alignment: Alignment.centerLeft,
          child: Text(
            'IBM Kaffsson',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.brown[800],
            ),
          ),
        );
    }
  }

  Widget moreDetail(IconData icon, String text) {
    return Container(
      child: Column(
        children: [
          Icon(
            icon,
            size: 150,
            color: Colors.brown[600],
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.brown[800],
              ),
            ),
          ),
          // How do i call the function addCupsButton based on a condition ?????
          /*
          if(activeStep == 1)   //want this for only when other user want a cup of coffee
          {
          addCupsButton(),
          }*/
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
}
