import 'package:burc_rehberi/model/zodiac_sign.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class ZodiacSignDetailView extends StatefulWidget {
  ZodiacSign zodiacSign;
  ZodiacSignDetailView({Key? key, required this.zodiacSign}) : super(key: key);

  @override
  State<ZodiacSignDetailView> createState() => _ZodiacSignDetailViewState();
}

class _ZodiacSignDetailViewState extends State<ZodiacSignDetailView> {
  Color appbarColor = Colors.transparent;
  late PaletteGenerator _generator;
  Color textColorBody = Colors.black;

  @override
  void initState() {
    super.initState();
    // ilk önce build methodunu çalıştır daha sonra burdaki fonksiyonu çalıştır.
    WidgetsBinding.instance.addPostFrameCallback((_) => appbarColorFind());
  }

  appbarColorFind() async {
    _generator = await PaletteGenerator.fromImageProvider(AssetImage('assets/images/${widget.zodiacSign.bigPicture}'));

    setState(() {
      appbarColor = _generator.dominantColor!.color;
      textColorBody = _generator.darkMutedColor!.color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: appbarColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('assets/images/${widget.zodiacSign.bigPicture}', fit: BoxFit.cover),
              title: Text('${widget.zodiacSign.name} Burcu ve Özellikleri'),
              centerTitle: true,
            ),
          ),
          SliverToBoxAdapter(
              child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Text(
                widget.zodiacSign.detail,
                style: TextStyle(fontSize: 20, color: textColorBody),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
