import 'fiestas_models.dart';

class Fiestas {
  List<Fiesta> lista = new List();

  Fiestas.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    jsonList.forEach((element) {
      final pnt = Fiesta.fromJson(element);
      lista.add(pnt);
    });
  }
}
