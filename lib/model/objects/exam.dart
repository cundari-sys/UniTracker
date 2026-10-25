class Exam { 
   final String id;
    final String nome;
    bool? lode;
    int? voto;
    final int cfu;
    DateTime? data;
    final bool superato;

    Exam({required this.id,required this.nome, required this.cfu, this.lode,this.voto,this.data, required this.superato});

    Exam copyWith({
    String? id,
    String? nome,
    bool? lode,
    int? cfu,
    int? voto,
    bool? superato,
  }) {
    return Exam(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      lode: lode ?? this.lode,
      cfu: cfu ?? this.cfu,
      voto: voto ?? this.voto,
      superato: superato ?? this.superato,
    );
  }
}