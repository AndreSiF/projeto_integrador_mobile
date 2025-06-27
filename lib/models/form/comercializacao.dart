import 'dart:ffi';

class Comercializacao {
  final String? ufOrigem;
  final String? especie;
  final Double? producaoKg;
  final Int? quantidade;
  final Double? precoMedio;

  Comercializacao(
    this.ufOrigem,
    this.especie,
    this.producaoKg,
    this.quantidade,
    this.precoMedio,
  );
}
