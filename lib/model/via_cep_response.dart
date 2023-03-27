import 'package:json_annotation/json_annotation.dart';

part 'via_cep_response.g.dart';

@JsonSerializable()
class ViaCepResponse {
  String? cep;
  String? logradouro;
  String? complemento;
  String? bairro;
  @JsonKey(name: 'localidade')
  String? resultadoLocalidade;
  String? uf;
  String? ibge;
  String? gia;
  String? ddd;
  String? siafi;

  ViaCepResponse({
    this.cep,
    this.logradouro,
    this.complemento,
    this.bairro,
    this.resultadoLocalidade,
    this.uf,
    this.ibge,
    this.gia,
    this.ddd,
    this.siafi,
  });

  factory ViaCepResponse.fromJson(Map<String, dynamic> json) {
    return _$ViaCepResponseFromJson(json);
  }
  Map<String, dynamic> toJson() => _$ViaCepResponseToJson(this);
}
