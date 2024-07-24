import 'package:flutter/material.dart';
import 'package:ui_test/constants/colors_app.dart';
import 'package:ui_test/constants/dimens_app.dart';
import 'package:ui_test/constants/text_style.dart';
import 'package:ui_test/views/home/data/location_data.dart';
import 'package:ui_test/views/home/data/tab_home.dart';
import 'package:ui_test/views/home/widgets/best_card.dart';
import 'package:ui_test/views/home/widgets/near_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.viewPaddingOf(context).top, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Lodon',
                style: TextStyleApp.inter_s15_m_black.style,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Row(
                      children: [
                        Text(
                          'Jakarta',
                          style: TextStyleApp.inter_s15_m_black.style,
                        ),
                        const Icon(Icons.keyboard_arrow_down_rounded)
                      ],
                    ),
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(children: [
                        Icon(
                          Icons.notifications_none,
                        ),
                        Positioned(
                          right: 3,
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 3,
                          ),
                        )
                      ]),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: TextField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 15),
                          hintText: 'Search address or near you',
                        ),
                        style: const TextStyle(color: Colors.grey),
                        onChanged: (String value) {},
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(DimensApp.size10),
                    decoration: BoxDecoration(
                        color: ColorsApp.primary,
                        borderRadius: const BorderRadius.all(
                            Radius.circular(DimensApp.size10))),
                    child: const InkWell(
                      child: Icon(
                        Icons.format_align_left_sharp,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                      listTabHome.length,
                      (index) =>
                          titleTabHome(listTabHome.elementAt(index), index)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Near from you',
                    style: TextStyleApp.inter_s15_sb_black.style,
                  ),
                  Text(
                    'See more',
                    style: TextStyleApp.inter_s15_m_grey.style,
                  )
                ],
              ),
              SizedBox(
                child: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(
                        listLocation.length,
                        (index) => NearCard(
                              locationData: listLocation.elementAt(index),
                            )),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Best for you',
                    style: TextStyleApp.inter_s15_sb_black.style,
                  ),
                  Text(
                    'See more',
                    style: TextStyleApp.inter_s15_m_grey.style,
                  )
                ],
              ),
              SizedBox(
                child: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(
                        listLocation.length,
                        (index) => BestCard(
                              locationData: listLocation.elementAt(index),
                            )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget titleTabHome(TabHome tabHome, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          for (var element in listTabHome) {
            if (element.id == tabHome.id) {
              if (!element.select) {
                element.select = !element.select;
              }
            } else {
              element.select = false;
            }
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: DimensApp.size20),
        padding: const EdgeInsets.all(DimensApp.size10),
        decoration: BoxDecoration(
            color: tabHome.select ? ColorsApp.primary : Colors.grey.shade100,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Text(
          tabHome.name,
          style: tabHome.select
              ? TextStyleApp.inter_s15_m_white.style
              : TextStyleApp.inter_s15_m_grey.style,
        ),
      ),
    );
  }
}
