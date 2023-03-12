import 'package:blended_learning_system/constants.dart';
import 'package:blended_learning_system/widgets/result_component.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:collection/collection.dart';

import '../data/result_data.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});
  static String routeName = "ResultScreen";

  @override
  Widget build(BuildContext context) {
    int oMarks = result.map((e) => e.obtainMarks).sum.toInt();
    int tMarks = result.map((e) => e.totalMarks).sum.toInt();

    return Scaffold(
      appBar: AppBar(
        title: Text("Results"),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            margin: EdgeInsets.all(MediaQuery.of(context).size.height / 3),
            child: CustomPaint(
              foregroundPainter: CircularPainter(
                  backgroundColor: kPrimaryColor,
                lineColor: kOtherColor,
                width: MediaQuery.of(context).size.width / 5),
              child: Center(child: Text(
                oMarks.toString()
                  +  '\n / \n'
                  + tMarks.toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1,

            )),
          ),
        ),
        Text(
          "You are excellence",
          style: Theme.of(context)
              .textTheme
              .subtitle2!
              .copyWith(fontWeight: FontWeight.w900),
        ),
        Text("Mpho!!", style: Theme.of(context).textTheme.subtitle1),
        sizedBox,
        Expanded(
          child: Container(
              decoration: BoxDecoration(
                borderRadius: kTopBorderRadius,
                color: kOtherColor,
              ),
              child: ListView.builder(
                  padding: EdgeInsets.all(kDefaultPadding),
                  itemCount: result.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: kDefaultPadding),
                      padding: EdgeInsets.all(kDefaultPadding / 2),
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(kDefaultPadding),
                          boxShadow: [
                            BoxShadow(
                              color: kTextLightColor,
                              blurRadius: 2.0,
                            )
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(result[index].subjectName,
                                    textAlign: TextAlign.start,
                                    style:
                                        Theme.of(context).textTheme.subtitle2),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${result[index].obtainMarks} / ${result[index].totalMarks}',
                                      style:
                                          Theme.of(context).textTheme.subtitle2,
                                    ),
                                    Stack(
                                      children: [
                                        Container(
                                          width: result[index]
                                              .totalMarks
                                              .toDouble(),
                                          height: MediaQuery.of(context).size.height / 2,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[700],
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(
                                                  kDefaultPadding),
                                              bottomRight: Radius.circular(
                                                  kDefaultPadding),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: MediaQuery.of(context).size.height / 2,
                                          width: result[index]
                                              .obtainMarks
                                              .toDouble(),
                                          decoration: BoxDecoration(
                                              color: result[index].grade == 'D'
                                                  ? kErrorBorderColor
                                                  : kOtherColor,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                      kDefaultPadding),
                                                  bottomRight: Radius.circular(
                                                      kDefaultPadding))),
                                        )
                                      ],
                                    ),
                                    Text(
                                      result[index].grade,
                                      textAlign: TextAlign.start,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(
                                            fontWeight: FontWeight.w900,
                                          ),
                                    )
                                  ],
                                ),
                              ]),
                        ],
                      ),
                    );
                  })),
        ),
      ]),
    );
  }
}
