import 'package:burc_rehberi/model/zodiac_sign.dart';
import 'package:burc_rehberi/view/zodiac_sign_detail_view.dart';
import 'package:flutter/material.dart';

class ZodiacSignItemView extends StatelessWidget {
  final ZodiacSign zodiacSignItem;

  const ZodiacSignItemView({Key? key, required this.zodiacSignItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myTextStyle = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset('assets/images/${zodiacSignItem.littlePicture}'),
            title: Text(
              zodiacSignItem.name,
              style: myTextStyle.headline5,
            ),
            subtitle: Text(
              zodiacSignItem.date,
              style: myTextStyle.subtitle1,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context).primaryColor,
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ZodiacSignDetailView(zodiacSign: zodiacSignItem)));
            },
          ),
        ),
      ),
    );
  }
}
