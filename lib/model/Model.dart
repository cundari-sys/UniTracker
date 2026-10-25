import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'objects/exam.dart';

class Model extends ChangeNotifier {
  static final Model _instance = Model._internal();
  factory Model() => _instance;
  Model._internal();
  static Model get instance => _instance;

  final List<Exam> _esamiFittizi = [
    // 1° Anno
    Exam(id: '5', nome: 'Analisi 1', cfu: 9, voto: 26, data: DateTime(2025, 2, 10), superato: true, lode: false, anno: 1),
    Exam(id: '6', nome: 'Fondamenti di Informatica', cfu: 12, voto: 30, superato: true, lode: true, anno: 1), 
    
    // 2° Anno
    Exam(id: '1', nome: 'Sistemi Operativi', cfu: 9, superato: false, anno: 2),
    Exam(id: '2', nome: 'Metodi e Ricerca Operativa', cfu: 9, superato: false, anno: 2),
    Exam(id: '3', nome: 'Basi di Dati (Mod. 1)', cfu: 6, superato: false, anno: 2),
    
    // 3° Anno
    Exam(id: '4', nome: 'Programmazione Mobile', cfu: 6, superato: false, anno: 3),
  ];

  List<Exam> get esami => _esamiFittizi;

  List<Exam> get esamiPrimoAnno => _esamiFittizi.where((e) => e.anno == 1).toList();
  List<Exam> get esamiSecondoAnno => _esamiFittizi.where((e) => e.anno == 2).toList();
  List<Exam> get esamiTerzoAnno => _esamiFittizi.where((e) => e.anno == 3).toList();

  List<Exam> esamiPerAnno(int anno) {
    return _esamiFittizi.where((e) => e.anno == anno).toList();
  }

  int get cfuTotali {
    return _esamiFittizi.where((e) => e.superato).fold(0, (s, e) => s + e.cfu);
  }

  double get mediaPonderata {
    final esamiSuperati = _esamiFittizi.where((e) => e.superato).toList();
    if (esamiSuperati.isEmpty) return 0.0;
    
    int sommaP = 0, sommaC = 0;
    for (final e in esamiSuperati) {
      sommaP += ((e.voto ?? 0) * e.cfu);
      sommaC += e.cfu;
    }
    return sommaP / sommaC;
  }

  double getProiezioneLaurea() {
    final media = mediaPonderata;
    if (media == 0.0) return 0.0;
    
    double baseLaurea = (media * 11) / 3;

    int numeroLodi = _esamiFittizi.where((e) => e.superato && (e.lode ?? false)).length;
    
    double bonusLodi = numeroLodi * 0.5;

    return baseLaurea + bonusLodi;
  }

  void eliminaEsame(String id) {
    _esamiFittizi.removeWhere((e) => e.id == id);
    notifyListeners();
  }

  void modificaEsame(Exam esameModificato) {
    final index = _esamiFittizi.indexWhere((e) => e.id == esameModificato.id);
    if (index != -1) {
      _esamiFittizi[index] = esameModificato;
      notifyListeners();
    }
  }
} 

final modelProvider = ChangeNotifierProvider<Model>((ref) {
  return Model.instance;
});