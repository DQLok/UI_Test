import 'package:flutter/material.dart';
import 'package:ui_test/constants/dimens_app.dart';
import 'package:ui_test/constants/image_app.dart';
import 'package:ui_test/constants/text_style.dart';
import 'package:ui_test/views/detail_location/detail_location.dart';
import 'package:ui_test/views/home/data/location_data.dart';

class NearCard extends StatelessWidget {
  const NearCard({super.key, required this.locationData});
  final LocationData locationData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DimensApp.size250,
      width: DimensApp.size200,
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.only(right: DimensApp.size20),
      child: Material(
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailLocation(
                          locationData: locationData,
                        )));
          },
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                    image: DecorationImage(
                      image: AssetImage(ImageApp.villa),
                      fit: BoxFit.fill,
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IntrinsicWidth(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: DimensApp.size5,
                          horizontal: DimensApp.size10),
                      padding: const EdgeInsets.all(DimensApp.size2),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade500,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: const Offset(0, -3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                          ),
                          Text(
                            locationData.distance,
                            style: TextStyleApp.inter_s15_m_white.style,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                  left: 10,
                  bottom: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: const Offset(0, -3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          locationData.name,
                          style: TextStyleApp.inter_s20_b_white.style,
                        ),
                        Text(
                          locationData.des,
                          style: TextStyleApp.inter_s10_m_white.style,
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
