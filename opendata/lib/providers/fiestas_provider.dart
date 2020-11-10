import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:trabajo_open_data/models/fiesta_model.dart';
import 'package:trabajo_open_data/models/fiestas_models.dart';

class FiestasProvider {
  final listaTipos = [
    'Punto limpio fijo',
    'Aceite de cocina usado',
    'Compostaje comunitario',
    'Pilas',
    'Ropa y calzado',
  ];

  List<Fiesta> listaFiestas = [];

  List<String> listaLocalidades = [];
  List<String> listaTiposfiestas = [];
  List<String> listaNombres = [];

  List<Fiesta> listaPuntosFiltrados = [];

  Future<List<Fiesta>> cargarFiestas() async {
    final data = await rootBundle.loadString('assets/data/Fiestas.json');
    final decodedData = json.decode(data);
    final openData = decodedData['OpenData'];
    final openDataRow = openData['OpenDataRow'];
    Fiestas fiestas = Fiestas.fromJsonList(openDataRow);
    listaFiestas = fiestas.lista;
    return listaFiestas;
  }

  Future<List<String>> cargarLocalidades() async {
    if (listaFiestas.length == 0) {
      await cargarFiestas();
    }
    listaLocalidades = [];
    listaFiestas.forEach((pr) {
      if (listaLocalidades.indexOf(pr.nombreLocalidad) < 0 &&
          pr.nombreLocalidad.length != 0) {
        listaLocalidades.add(pr.nombreLocalidad);
      }
    });
    return listaLocalidades;
  }

  Future<List<String>> cargarTipos(String localidades) async {
    if (listaFiestas.length == 0) {
      await cargarFiestas();
    }
    listaTiposfiestas = [];
    listaFiestas.forEach((pr) {
      if ((listaTiposfiestas.indexOf(pr.tipo) < 0) && pr.tipo.length != 0) {
        listaTiposfiestas.add(pr.tipo);
      }
    });
    return listaTiposfiestas;
  }
}

final fiestasProvider = new FiestasProvider();


