import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trabajo_open_data/providers/fiestas_provider.dart';

class ListaTiposScreen extends StatelessWidget {
  Map<String, Object> args = new Map<String, Object>();
  //final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    //box.write('mancomunidad', null);
    //box.write('localidad', null);
    //box.write('tipo', null);
    return Scaffold(
      appBar: AppBar(
        title: Text("Tipos"),
      ),
      //drawer: MenuWidget(),
      body: _lista(context),
    );
  }

  Widget _lista(BuildContext context) {
    return FutureBuilder(
      future: fiestasProvider.cargarTipos(),
      initialData: [],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            children: _listaElementos(context, snapshot.data),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  List<Widget> _listaElementos(BuildContext context, List<String> data) {
    final List<Widget> lst = [];
    data.forEach((element) {
      final w = ListTile(
        title: Text(element),
        trailing: Icon(Icons.keyboard_arrow_right),
        //onTap: () {
        //box.write('mancomunidad', element);
        //args['mancomunidad'] = element;
        // Navigator.pushNamed(context, 'localidades', arguments: args);
        //Get.offAll(ListaTipos(), arguments: args);
        //},
      );
      lst.add(w);
      lst.add(Divider());
    });
    return lst;
  }
}
