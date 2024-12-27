import 'package:json_annotation/json_annotation.dart';

part 'zip_code_data.g.dart';

@JsonSerializable()
class ZipCodeData {
  const ZipCodeData(
      {this.cep,
      this.logradouro,
      this.complemento,
      this.unidade,
      this.bairro,
      this.localidade,
      this.uf,
      this.estado,
      this.regiao,
      this.ibge,
      this.gia,
      this.ddd,
      this.siafi});

  factory ZipCodeData.fromJson(Map<String, dynamic> json) =>
      _$ZipCodeDataFromJson(json);

  final String? cep;
  final String? logradouro;
  final String? complemento;
  final String? unidade;
  final String? bairro;
  final String? localidade;
  final String? uf;
  final String? estado;
  final String? regiao;
  final String? ibge;
  final String? gia;
  final String? ddd;
  final String? siafi;

  Map<String, dynamic> toJson() => _$ZipCodeDataToJson(this);
}
