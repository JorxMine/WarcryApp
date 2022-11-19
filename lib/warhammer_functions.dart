import 'package:flutter/material.dart';
import 'package:warcry_app/main.dart';
import 'package:warcry_app/warhammer_info.dart';
import 'package:warcry_app/warhammer_mini.dart';

String allianceName = "Grand Alliance Of Order";

class Functions {
  Text textStyler(String text, double textSize, bool alignLeft) {
    var textWithStyle;

    if (alignLeft) {
      textWithStyle = Text(
        text,
        style: TextStyle(
          fontSize: textSize,
        ),
        textAlign: TextAlign.start,
      );
    } else {
      textWithStyle = Text(
        text,
        style: TextStyle(
          fontSize: textSize,
        ),
      );
    }
    return textWithStyle;
  }

  Expanded expandedBoxConstructor(double paddingTextImage, String text,
      String imageDirectory, BuildContext context) {
    var expandedBoxes;

    expandedBoxes = Expanded(
      flex: 5,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: paddingTextImage),
            child: Image(
              image: AssetImage(imageDirectory),
              height: 16,
            ),
          ),
          textStyler(text, 16, true)
        ],
      ),
    );

    return expandedBoxes;
  }

  Row cardConstructor(String unitName, int unitCost, String unitImage,
      int unitRating, BuildContext context) {
    var paddingPlease = const EdgeInsets.all(8.0);
    var containerWidthImage = MediaQuery.of(context).size.width * 0.25;

    var warhammerCard = Row(children: [
      Expanded(
        flex: 3,
        child: Image(
          image: AssetImage(unitImage),
        ),
      ),
      Expanded(
          flex: 7,
          child: Column(
            children: [
              Row(
                children: [textStyler(allianceName, 20, true)],
              ),
              Row(
                children: [textStyler(unitName, 16, true)],
              ),
              Row(
                children: [
                  expandedBoxConstructor(5, unitCost.toString(),
                      "assets/images/money.jpg", context),
                  expandedBoxConstructor(5, unitRating.toString(),
                      "assets/images/star.jpg", context)
                ],
              )
            ],
          ))
    ]);

    return warhammerCard;
  }
}
