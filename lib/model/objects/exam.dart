class Exam {
  final String id;
  final String nome;
  bool? lode;
  int? voto;
  final int cfu;
  DateTime? data;
  final bool superato;
  final int anno; 

  Exam({
    required this.id,
    required this.nome,
    required this.cfu,
    this.lode,
    this.voto,
    this.data,
    required this.superato,
    required this.anno,
  });

  Exam copyWith({
    String? id,
    String? nome,
    bool? lode,
    int? cfu,
    int? voto,
    bool? superato,
    int? anno,
  }) {
    return Exam(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      lode: lode ?? this.lode,
      cfu: cfu ?? this.cfu,
      voto: voto ?? this.voto,
      superato: superato ?? this.superato,
      anno: anno ?? this.anno,
    );
  }
}