import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:free_style_flutter/check/data/point.dart';

class CheckPage extends StatefulWidget {
  const CheckPage({super.key});

  @override
  State<CheckPage> createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  TextEditingController controller = TextEditingController();
  int count = 1;
  double radius = 10;
  double large = 2;
  List<PointCorner> listCorners = [];
  bool selectChange = false;

  @override
  void initState() {
    super.initState();
  }

  createSize(double width, double height, double marginTop) {
    if (controller.text.isEmpty) return;
    listCorners = [];
    count = int.parse(controller.text);
    //corners
    for (int i = 0; i < count; i++) {
      for (int j = 0; j < count; j++) {
        listCorners.add(PointCorner(
            dx: (width / count) * (j + 1) - radius,
            dy: (height - marginTop) * (i + 1) / count - radius,
            selectFirst: false,
            selectSeconds: false));
      }
    }
    log(listCorners.toString());
    setState(() {});
  }

  selectPoint(TapUpDetails details, double marginTop) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    Offset offset = renderBox.globalToLocal(details.globalPosition);
    log("${offset.dx} - ${offset.dy}");
    log("${radius * 1.5}");
    log("${listCorners.first.dx - offset.dx - large} && ${listCorners.first.dy - (offset.dy - marginTop - large)}");
    int index = listCorners.indexWhere(
      (element) => ((element.dx - offset.dx - large).abs() <= radius * 1.5 &&
          (element.dy - (offset.dy - marginTop - large)).abs() <= radius * 1.5),
    );
    if (index != -1) {
      listCorners.elementAt(index).selectChange(selectChange);
      selectChange = !selectChange;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double marginTop = MediaQuery.viewPaddingOf(context).top + 50;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GestureDetector(
        onTapUp: (TapUpDetails details) {
          selectPoint(details, marginTop);
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50,
                width: width / 4,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                margin:
                    EdgeInsets.only(top: MediaQuery.viewPaddingOf(context).top),
                alignment: Alignment.center,
                child: TextField(
                  controller: controller,
                  onSubmitted: (value) {
                    createSize(width, height, marginTop);
                  },
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                ),
              ),
              Container(
                width: width,
                height: height - marginTop,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black)),
                child: Stack(children: [
                  //row
                  ...List.generate(
                    count,
                    (index) => Positioned(
                      left: (width / count) * (++index),
                      child: Container(
                        width: large,
                        height: MediaQuery.of(context).size.height,
                        decoration: const BoxDecoration(color: Colors.black),
                      ),
                    ),
                  ),
                  //column
                  ...List.generate(
                    count,
                    (index) => Positioned(
                      top: (height - marginTop) * (++index) / count,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: large,
                        decoration: const BoxDecoration(color: Colors.black),
                      ),
                    ),
                  ),
                  //conner
                  ...List.generate(
                    listCorners.length,
                    (index) => Positioned(
                        left: listCorners.elementAt(index).dx,
                        top: listCorners.elementAt(index).dy,
                        child: CircleAvatar(
                          radius: listCorners.elementAt(index).selectFirst ||
                                  listCorners.elementAt(index).selectSeconds
                              ? radius
                              : 0,
                          backgroundColor:
                              listCorners.elementAt(index).selectFirst
                                  ? Colors.red
                                  : listCorners.elementAt(index).selectSeconds
                                      ? Colors.yellow
                                      : null,
                        )),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
