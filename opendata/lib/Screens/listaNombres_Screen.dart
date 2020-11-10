import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:opendata/providers/fiestas_provider.dart';
import 'package:opendata/widgets/swiper_widget.dart';


class NombresScreen extends StatelessWidget {
  //final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    //box.write('mancomunidad', null);
    //box.write('localidad', null);
    //box.write('tipo', null);
    return Scaffold(
      appBar: AppBar(
        title: Text("Localidades"),
      ),
      //drawer: MenuWidget(),
      body: _lista(context),
    );
  }

  Widget _lista(BuildContext context) {
    return FutureBuilder(
      future: fiestasProvider.cargarFiestas(),
      initialData: [],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Swiperwidget(fiesta: snapshot.data);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
