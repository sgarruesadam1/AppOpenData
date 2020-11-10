import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:opendata/models/fiestas_models.dart';

class Swiperwidget extends StatelessWidget {
  final List<Fiesta> fiesta;

  Swiperwidget({@required this.fiesta});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _swiper(context),
    );
  }

  Widget _swiper(context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return new Image.network(fiesta[index].getImgUrl());
      },
      itemCount: fiesta.length,
      //pagination: new SwiperPagination(),
      //control: new SwiperControl(),
    );
  }
}
