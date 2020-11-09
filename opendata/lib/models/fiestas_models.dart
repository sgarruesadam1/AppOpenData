// To parse this JSON data, do
//
//     final fiesta = fiestaFromJson(jsonString);

import 'dart:convert';

Fiesta fiestaFromJson(String str) => Fiesta.fromJson(json.decode(str));

String fiestaToJson(Fiesta data) => json.encode(data.toJson());

class Fiesta {
  Fiesta({
    this.codrecurso,
    this.urlNombreCast,
    this.nombre,
    this.urlNombreBuscador,
    this.tipo,
    this.codCategoria,
    this.idRecursoCategoria,
    this.idcategoria,
    this.nombreLocalidad,
    this.urlIdRecursoCategoria,
    this.path,
    this.imgFichero,
    this.descripZona,
    this.distancia,
    this.georrX,
    this.georrY,
    this.diplomacompromiso,
  });

  String codrecurso;
  String urlNombreCast;
  String nombre;
  String urlNombreBuscador;
  String tipo;
  String codCategoria;
  String idRecursoCategoria;
  String idcategoria;
  String nombreLocalidad;
  String urlIdRecursoCategoria;
  String path;
  String imgFichero;
  String descripZona;
  String distancia;
  String georrX;
  String georrY;
  String diplomacompromiso;

  factory Fiesta.fromJson(Map<String, dynamic> json) => Fiesta(
        codrecurso: json["Codrecurso"],
        urlNombreCast: json["URLNombreCast"],
        nombre: json["Nombre"],
        urlNombreBuscador: json["URLNombreBuscador"],
        tipo: json["TIPO"],
        codCategoria: json["CodCategoria"],
        idRecursoCategoria: json["IdRecursoCategoria"],
        idcategoria: json["IDCATEGORIA"],
        nombreLocalidad: json["NombreLocalidad"],
        urlIdRecursoCategoria: json["URLIdRecursoCategoria"],
        path: json["Path"],
        imgFichero: json["ImgFichero"],
        descripZona: json["DescripZona"],
        distancia: json["Distancia"],
        georrX: json["GEORR_X"],
        georrY: json["GEORR_Y"],
        diplomacompromiso: json["DIPLOMACOMPROMISO"],
      );

  Map<String, dynamic> toJson() => {
        "Codrecurso": codrecurso,
        "URLNombreCast": urlNombreCast,
        "Nombre": nombre,
        "URLNombreBuscador": urlNombreBuscador,
        "TIPO": tipo,
        "CodCategoria": codCategoria,
        "IdRecursoCategoria": idRecursoCategoria,
        "IDCATEGORIA": idcategoria,
        "NombreLocalidad": nombreLocalidad,
        "URLIdRecursoCategoria": urlIdRecursoCategoria,
        "Path": path,
        "ImgFichero": imgFichero,
        "DescripZona": descripZona,
        "Distancia": distancia,
        "GEORR_X": georrX,
        "GEORR_Y": georrY,
        "DIPLOMACOMPROMISO": diplomacompromiso,
      };
}
