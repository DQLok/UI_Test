import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ui_test/constants/colors_app.dart';
import 'package:ui_test/constants/dimens_app.dart';
import 'package:ui_test/constants/image_app.dart';
import 'package:ui_test/constants/text_style.dart';
import 'package:ui_test/views/home/data/location_data.dart';

class DetailLocation extends StatefulWidget {
  const DetailLocation({super.key, required this.locationData});
  final LocationData locationData;

  @override
  State<DetailLocation> createState() => _DetailLocationState();
}

class _DetailLocationState extends State<DetailLocation> {
  bool checkShow = false;
  String textMore =
      'The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars.';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(
            vertical: MediaQuery.viewPaddingOf(context).top),
        padding: const EdgeInsets.symmetric(
            vertical: DimensApp.size10, horizontal: DimensApp.size10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3,
                padding: const EdgeInsets.symmetric(
                    vertical: DimensApp.size10, horizontal: DimensApp.size10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                    image: DecorationImage(
                      image: AssetImage(ImageApp.villa),
                      fit: BoxFit.fill,
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 5,
                                  blurRadius: 10,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.grey.shade400,
                              child: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 5,
                                blurRadius: 10,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey.shade400,
                            child: const Icon(
                              Icons.tab,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            widget.locationData.name,
                            style: TextStyleApp.inter_s20_b_white.style,
                          ),
                          Text(
                            widget.locationData.des,
                            style: TextStyleApp.inter_s10_m_white.style,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                child: Row(
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.all(
                                            DimensApp.size5),
                                        decoration: const BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                    DimensApp.size10))),
                                        child: const Icon(
                                          Icons.bed,
                                          size: 20,
                                          color: Colors.white,
                                        )),
                                    Container(
                                        margin: const EdgeInsets.only(
                                            left: DimensApp.size5),
                                        child: Text(
                                          '${widget.locationData.bedRooms} Bedroom',
                                          style: TextStyleApp
                                              .inter_s10_m_white.style,
                                        ))
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: DimensApp.size50,
                              ),
                              SizedBox(
                                child: Row(
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.all(
                                            DimensApp.size5),
                                        decoration: const BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                    DimensApp.size10))),
                                        child: const Icon(
                                          Icons.bathtub_outlined,
                                          size: 20,
                                          color: Colors.white,
                                        )),
                                    Container(
                                        margin: const EdgeInsets.only(
                                            left: DimensApp.size5),
                                        child: Text(
                                            '${widget.locationData.bathRooms} Bathroom',
                                            style: TextStyleApp
                                                .inter_s10_m_white.style))
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: DimensApp.size20),
                  child: Text(
                    'Description',
                    style: TextStyleApp.inter_s15_sb_black.style,
                  )),
              SizedBox(
                  child: RichText(
                      text: TextSpan(
                          text:
                              'The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars. ${checkShow ? textMore : ''}',
                          style: TextStyleApp.inter_s15_m_grey.style,
                          children: [
                    WidgetSpan(
                        child: InkWell(
                      onTap: () {
                        setState(() {
                          checkShow = !checkShow;
                        });
                      },
                      child: Text(checkShow ? 'Show Less' : 'Show More',
                          style: TextStyle(color: ColorsApp.primary)),
                    )),
                  ]))),
              Container(
                margin: const EdgeInsets.symmetric(vertical: DimensApp.size20),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: ColorsApp.primary,
                      radius: 30,
                      child: const Icon(
                        Icons.person_outline_rounded,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: DimensApp.size10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Garry Allen',
                            style: TextStyleApp.inter_s15_m_black.style,
                          ),
                          Text(
                            'Owner',
                            style: TextStyleApp.inter_s10_m_black.style,
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Container(
                          margin:
                              const EdgeInsets.only(right: DimensApp.size10),
                          padding: const EdgeInsets.all(DimensApp.size5),
                          decoration: BoxDecoration(
                              color: ColorsApp.primary,
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(DimensApp.size10))),
                          child: const Icon(
                            Icons.phone,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(DimensApp.size5),
                          decoration: BoxDecoration(
                              color: ColorsApp.primary,
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(DimensApp.size10))),
                          child: const Icon(
                            Icons.chat_bubble_rounded,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: DimensApp.size10),
                child: Text(
                  'Gallery',
                  style: TextStyleApp.inter_s15_sb_black.style,
                ),
              ),
              SizedBox(
                height: DimensApp.size100,
                width: double.infinity,
                child: GridView.count(
                    primary: false,
                    padding:
                        const EdgeInsets.symmetric(vertical: DimensApp.size10),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 4,
                    children: [
                      Container(
                        height: DimensApp.size80,
                        width: DimensApp.size80,
                        margin: const EdgeInsets.only(right: DimensApp.size5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                            image: DecorationImage(
                              image: AssetImage(ImageApp.villa),
                              fit: BoxFit.fill,
                            )),
                      ),
                      Container(
                        height: DimensApp.size80,
                        width: DimensApp.size80,
                        margin: const EdgeInsets.only(right: DimensApp.size5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                            image: DecorationImage(
                              image: AssetImage(ImageApp.villa),
                              fit: BoxFit.fill,
                            )),
                      ),
                      Container(
                        height: DimensApp.size80,
                        width: DimensApp.size80,
                        margin: const EdgeInsets.only(right: DimensApp.size5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                            image: DecorationImage(
                              image: AssetImage(ImageApp.villa),
                              fit: BoxFit.fill,
                            )),
                      ),
                      Container(
                        height: DimensApp.size80,
                        width: DimensApp.size80,
                        margin: const EdgeInsets.only(right: DimensApp.size5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                            image: DecorationImage(
                                image: AssetImage(ImageApp.villa),
                                fit: BoxFit.fill,
                                opacity: 0.8)),
                        child: Center(
                          child: Text(
                            '+5',
                            style: TextStyleApp.inter_s15_m_white.style,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ]),
              ),
              Container(
                height: DimensApp.size200,
                margin: const EdgeInsets.symmetric(vertical: DimensApp.size20),
                child: GoogleMap(
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(10.840626, 106.647840),
                    bearing: 0,
                    zoom: 16,
                  ),
                  markers: {
                    const Marker(
                        markerId: MarkerId('1'),
                        icon: BitmapDescriptor.defaultMarker,
                        position: LatLng(10.840626, 106.647840))
                  },
                ),
              )
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(
            vertical: DimensApp.size5, horizontal: DimensApp.size10),
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          children: [
            Expanded(
                child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Price',
                    style: TextStyleApp.inter_s15_m_grey.style,
                  ),
                  Text(
                    'Rp. ${widget.locationData.price}',
                    style: TextStyleApp.inter_s15_sb_black.style,
                  ),
                ],
              ),
            )),
            InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: DimensApp.size10, horizontal: DimensApp.size15),
                decoration: BoxDecoration(
                    color: ColorsApp.primary,
                    borderRadius: const BorderRadius.all(
                        Radius.circular(DimensApp.size8))),
                child: Text(
                  'Rent Now',
                  style: TextStyleApp.inter_s15_m_white.style,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
