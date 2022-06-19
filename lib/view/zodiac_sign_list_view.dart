// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:burc_rehberi/data/zodiac_sign_info.dart';
import 'package:burc_rehberi/model/zodiac_sign.dart';
import 'package:burc_rehberi/view/zodiac_sign_item_view.dart';
import 'package:flutter/material.dart';

class ZodiacSignListView extends StatelessWidget {
  late List<ZodiacSign> allZodiacSign;

  ZodiacSignListView() {
    allZodiacSign = setDataSourc();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BURÇ REHBERİ', style: Theme.of(context).textTheme.headline5),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: allZodiacSign.length,
          itemBuilder: (context, index) {
            return ZodiacSignItemView(
              zodiacSignItem: allZodiacSign[index],
            );
          },
        ),
      ),
    );
  }

  List<ZodiacSign> setDataSourc() {
    List<ZodiacSign> temporaryList = [];

    for (var i = 0; i < 12; i++) {
      temporaryList.add(ZodiacSign(
        name: ZodiacSignInfo.ZODIAC_SIGN_NAME[i],
        date: ZodiacSignInfo.ZODIAC_SIGNS_DATE[i],
        detail: ZodiacSignInfo.ZODIAC_SIGNS_GENERAL_FEATURES[i],
        littlePicture: '${ZodiacSignInfo.ZODIAC_SIGN_NAME[i].toLowerCase()}${i + 1}.png',
        bigPicture: '${ZodiacSignInfo.ZODIAC_SIGN_NAME[i].toLowerCase()}_buyuk${i + 1}.png',
      ));
    }
    return temporaryList;
  }
}
