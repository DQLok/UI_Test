import 'package:flutter/material.dart';
import 'package:ui_test/constants/colors_app.dart';
import 'package:ui_test/constants/dimens_app.dart';
import 'package:ui_test/constants/text_style.dart';
import 'package:ui_test/views/drawer/data.dart';
import 'package:ui_test/views/home/home_screen.dart';

class DrawerCus extends StatefulWidget {
  const DrawerCus({super.key});

  @override
  State<DrawerCus> createState() => _DrawerCusState();
}

class _DrawerCusState extends State<DrawerCus> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: ColorsApp.primary,
        child: Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(listTabMenu.length,
                  (index) => titleDrawer(listTabMenu.elementAt(index), index)),
            ),
          ),
        ),
      ),
    );
  }

  Widget titleDrawer(TabMenu tabMenu, int index) {
    if (tabMenu.id == "" && tabMenu.name == "") {
      return Container(
          margin: const EdgeInsets.symmetric(vertical: DimensApp.size10),
          child: const Divider());
    }
    if (tabMenu.id != "" && tabMenu.name != "") {
      bool check =
          ++index % 3 != 0 || index == listTabMenu.length ? true : false;
      bool checkNotice =
          tabMenu.id == 'notification' || tabMenu.id == 'message';
      return Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                for (var element in listTabMenu) {
                  if (element.id == tabMenu.id) {
                    if (!element.select) {
                      element.select = !element.select;
                    }
                  } else {
                    element.select = false;
                  }
                }
                if (tabMenu.id == 'home') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                }
              });
            },
            child: Container(
              margin: const EdgeInsets.only(top: 15, bottom: 10, right: 50),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: tabMenu.select ? Colors.white : null),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(children: [
                    Icon(
                      tabMenu.icon,
                      color: tabMenu.select ? ColorsApp.primary : Colors.white,
                    ),
                    !checkNotice
                        ? const SizedBox.shrink()
                        : const Positioned(
                            right: 0,
                            child: CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 3,
                            ),
                          )
                  ]),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: DimensApp.size10),
                      child: Text(
                        tabMenu.name,
                        overflow: TextOverflow.visible,
                        maxLines: 1,
                        style: tabMenu.select
                            ? TextStyleApp.inter_s15_m_primary.style
                            : TextStyleApp.inter_s15_m_white.style,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          check
              ? const SizedBox.shrink()
              : Container(
                  margin: const EdgeInsets.only(right: 50), child: const Divider())
        ],
      );
    }
    return Container(
      margin: const EdgeInsets.only(bottom: DimensApp.size10),
      child: Text(
        tabMenu.name,
        overflow: TextOverflow.visible,
        maxLines: 1,
        style: TextStyleApp.inter_s15_sb_black.style,
      ),
    );
  }
}
