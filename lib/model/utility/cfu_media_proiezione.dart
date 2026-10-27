class AcademicCalculator {
  
  static int calcolaCfuTotali(List<dynamic> esami) {
    return esami.where((e) => e.superato).fold(0, (s, e) => s + (e.cfu as int));
  }

  static double calcolaMediaPonderata(List<dynamic> esami) {
    final esamiSuperati = esami.where((e) => e.superato).toList();
    if (esamiSuperati.isEmpty) return 0.0;
    
    int sommaP = 0, sommaC = 0;

    for (final e in esamiSuperati) {
      sommaP += (((e.voto ?? 0) as num) * (e.cfu as int)).toInt();
      sommaC += (e.cfu as int);
    }
    
    if (sommaC == 0) return 0.0;
    return sommaP / sommaC;
  }

  static double calcolaProiezione(List<dynamic> esami) {
    final media = calcolaMediaPonderata(esami);
    if (media == 0.0) return 0.0;
    
    double baseLaurea = (media * 11) / 3;
    int numeroLodi = esami.where((e) => e.superato && (e.lode ?? false)).length;
    double bonusLodi = numeroLodi * 0.5;

    return baseLaurea + bonusLodi;
  }
}