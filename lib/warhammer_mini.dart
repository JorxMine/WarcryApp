import 'package:flutter/material.dart';
import 'package:warcry_app/main.dart';
import 'package:warcry_app/warhammer_info.dart';
import 'warhammer_functions.dart';

// App Globals

var functions = Functions();
var newRatingEstablished = NewRatingEstablished();

class UnitChoosed {
  late int index;
  late String unitNameChoosed;
  late String unitImageChoosed;
  late double unitRatingChoosed;
}

class NewRatingEstablished {
  late double newRating = 10;
}

// App Classes

class ToWarhammerMiniInfo extends StatefulWidget {
  const ToWarhammerMiniInfo({super.key, required this.title});

  final String title;

  @override
  State<ToWarhammerMiniInfo> createState() => _ToWarhammerMiniInfo();
}

// Main App

class _ToWarhammerMiniInfo extends State<ToWarhammerMiniInfo> {
  double minValue = 0.0;
  double maxValue = 10.0;
  double currentRating = 5;

  @override
  Widget build(BuildContext context) {
    var imageSize = MediaQuery.of(context).size.width * 0.8;
    unitChoosed.unitRatingChoosed = currentRating;
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: imageSize,
            child: Image(
              image: AssetImage(unitChoosed.unitImageChoosed),
            ),
          ),
          functions.textStyler(allianceName, 30.0, false),
          functions.textStyler(unitChoosed.unitNameChoosed, 25.0, false),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                child: Image(
                  image: AssetImage("assets/images/star.jpg"),
                  width: 64,
                ),
              ),
              functions.textStyler(
                  unitChoosed.unitRatingChoosed.toString(), 64, false),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Slider(
              divisions: 10,
              min: minValue,
              max: maxValue,
              value: currentRating,
              onChanged: (newRating) {
                setState(() => currentRating = newRating);
                newRatingEstablished.newRating = newRating;
              },
              label: "$currentRating",
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 32),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
                ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                );
                Navigator.pop(
                  context,
                );
              },
              child: const Text(
                'Submit Rating',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
