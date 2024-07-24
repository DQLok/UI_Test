import 'package:flutter/material.dart';
import 'package:ui_test/constants/dimens_app.dart';
import 'package:ui_test/constants/image_app.dart';
import 'package:ui_test/constants/text_style.dart';
import 'package:ui_test/views/detail_location/detail_location.dart';
import 'package:ui_test/views/home/data/location_data.dart';
import 'package:ui_test/views/widgets/image_cus.dart';

class BestCard extends StatelessWidget {
  const BestCard({super.key, required this.locationData});
  final LocationData locationData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailLocation(
                      locationData: locationData,
                    )));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: DimensApp.size10),
        child: Row(
          children: [
            SizedBox(
              height: DimensApp.size100,
              width: DimensApp.size100,
              child: ImageCus(
                pngPath: ImageApp.villa,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: DimensApp.size10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    locationData.name,
                    style: TextStyleApp.inter_s15_sb_black.style,
                  ),
                  Text(
                    'Rp ${locationData.price}',
                    style: TextStyleApp.inter_s10_m_primary.style,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: DimensApp.size30),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.bed,
                              size: 20,
                              color: Colors.grey,
                            ),
                            Text(
                              '${locationData.bedRooms} Bedroom',
                              style: TextStyleApp.inter_s10_m_grey.style,
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.bathtub_outlined,
                            size: 20,
                            color: Colors.grey,
                          ),
                          Text('${locationData.bathRooms} Bathroom',
                              style: TextStyleApp.inter_s10_m_grey.style)
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
