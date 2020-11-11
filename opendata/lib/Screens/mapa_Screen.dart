import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong/latlong.dart';
import 'package:opendata/models/fiesta_model.dart';
import 'package:opendata/models/fiestas_models.dart';
import 'package:opendata/screens/listaNombres_screen.dart';
import 'package:utm/utm.dart';

class MapaScreen extends StatefulWidget {
  final Fiesta fiesta;

  MapaScreen({@required this.fiesta});

  @override
  _MapaScreenState createState() => _MapaScreenState(fiesta: fiesta);
}

class _MapaScreenState extends State<MapaScreen> {
  final Fiesta fiesta;
  final map = new MapController();
  var latlon;

  _MapaScreenState({@required this.fiesta}) {
    latlon = UTM.fromUtm(
      easting: double.parse(fiesta.georrX),
      northing: double.parse(fiesta.georrY),
      zoneNumber: 30,
      zoneLetter: "N",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "Ubicacion donde se encuentran las Fiestas / Tradiciones / Eventos"),
        ),
        //drawer: MenuWidget(),
        body: Column(
          children: [
            SizedBox(
              height: 30.0,
            ),
            _header(),
            SizedBox(
              height: 30.0,
            ),
            Container(
              child: _flutterMap(),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
            )
          ],
        ));
  }

  Widget _header() {
    return Container(
      child: Column(
        children: [
          Text("jeje"),
        ],
      ),
    );
  }

  Widget _flutterMap() {
    return new FlutterMap(
      mapController: map,
      options: new MapOptions(
        center: new LatLng(latlon.lat, latlon.lon),
        zoom: 18.0,
      ),
      layers: [
        _mapa(),
        _markers(),
      ],
    );
  }

  _mapa() {
    return new TileLayerOptions(
      urlTemplate: "https://api.tiles.mapbox.com/v4/"
          "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
      additionalOptions: {
        'accessToken':
            'pk.eyJ1IjoiZWliYXJyb2xhc2RhbTEiLCJhIjoiY2toY2NoN2pqMW1vbDJ3bnE2bXZqazlocCJ9.yroKJ9Nf5oAVUbwpWF6dcQ',
        'id': 'mapbox.satellite',
      },
    );
  }

  _markers() {
    return new MarkerLayerOptions(
      markers: [
        new Marker(
          width: 50.0,
          height: 50.0,
          point: new LatLng(latlon.lat, latlon.lon),
          builder: (ctx) => new Container(
            child: Icon(Icons.place, color: Colors.red[700]),
          ),
        ),
      ],
    );
  }
}
