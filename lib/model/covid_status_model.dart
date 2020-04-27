///    This program is free software: you can redistribute it and/or modify
///    it under the terms of the GNU General Public License as published by
///    the Free Software Foundation, either version 3 of the License, or
///    (at your option) any later version.
///
///    This program is distributed in the hope that it will be useful,
///    but WITHOUT ANY WARRANTY; without even the implied warranty of
///    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
///    GNU General Public License for more details.
///
///    You should have received a copy of the GNU General Public License
///    along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'package:json_annotation/json_annotation.dart';

part 'covid_status_model.g.dart';

@JsonSerializable(includeIfNull: false)
class CovidStatusModel {
  @JsonKey(name: 'data')
  final Map<int, String> dates;

  @JsonKey(name: 'data_dados')
  final Map<int, String> datesData;

  @JsonKey(name: 'confirmados')
  final Map<int, double> confirmed;

  @JsonKey(name: 'confirmados_arsnorte')
  final Map<int, double> confirmedARSNorth;

  @JsonKey(name: 'confirmados_arscentro')
  final Map<int, double> confirmedARSCenter;

  @JsonKey(name: 'confirmados_arslvt')
  final Map<int, double> confirmedARSLVT;

  @JsonKey(name: 'confirmados_alentejo')
  final Map<int, double> confirmedAlentejo;

  @JsonKey(name: 'confirmados_arsalgarve')
  final Map<int, double> confirmedARSAlgarve;

  @JsonKey(name: 'confirmados_acores')
  final Map<int, double> confirmedAcores;

  @JsonKey(name: 'confirmados_madeira')
  final Map<int, double> confirmedMadeira;

  @JsonKey(name: 'confirmados_estrangeiro')
  final Map<int, double> confirmedForeign;

  @JsonKey(name: 'confirmados_novos')
  final Map<int, double> confirmedNew;

  @JsonKey(name: 'recuperados')
  final Map<int, double> recovered;

  @JsonKey(name: 'obitos')
  final Map<int, double> deaths;

  @JsonKey(name: 'internados')
  final Map<int, double> hospitalized;

  @JsonKey(name: 'internados_uci')
  final Map<int, double> hospitalizedUCI;

  @JsonKey(name: 'lab')
  final Map<int, double> waitingResults;

  @JsonKey(name: 'suspeitos')
  final Map<int, double> suspects;

  @JsonKey(name: 'vigilancia')
  final Map<int, double> surveillance;

  @JsonKey(name: 'n_confirmados')
  final Map<int, double> confirmedNumber;

  @JsonKey(name: 'cadeias_transmissao')
  final Map<int, double> transmissionChains;

  @JsonKey(name: 'transmissao_importada')
  final Map<int, double> transmissionChainsImported;

  @JsonKey(name: 'confirmados_0_9_f')
  final Map<int, double> confirmedAge0to9SexFemale;

  @JsonKey(name: 'confirmados_0_9_m')
  final Map<int, double> confirmedAge0to9SexMale;

  @JsonKey(name: 'confirmados_10_19_f')
  final Map<int, double> confirmedAge10to19SexFemale;

  @JsonKey(name: 'confirmados_10_19_m')
  final Map<int, double> confirmedAge10to19SexMale;

  @JsonKey(name: 'confirmados_20_29_f')
  final Map<int, double> confirmedAge20to29SexFemale;

  @JsonKey(name: 'confirmados_20_29_m')
  final Map<int, double> confirmedAge20to29SexMale;

  @JsonKey(name: 'confirmados_30_39_f')
  final Map<int, double> confirmedAge30to39SexFemale;

  @JsonKey(name: 'confirmados_30_39_m')
  final Map<int, double> confirmedAge30to39SexMale;

  @JsonKey(name: 'confirmados_40_49_f')
  final Map<int, double> confirmedAge40to49SexFemale;

  @JsonKey(name: 'confirmados_40_49_m')
  final Map<int, double> confirmedAge40to49SexMale;

  @JsonKey(name: 'confirmados_50_59_f')
  final Map<int, double> confirmedAge50to59SexFemale;

  @JsonKey(name: 'confirmados_50_59_m')
  final Map<int, double> confirmedAge50to59SexMale;

  @JsonKey(name: 'confirmados_60_69_f')
  final Map<int, double> confirmedAge60to69SexFemale;

  @JsonKey(name: 'confirmados_60_69_m')
  final Map<int, double> confirmedAge60to69SexMale;

  @JsonKey(name: 'confirmados_70_79_f')
  final Map<int, double> confirmedAge70to79SexFemale;

  @JsonKey(name: 'confirmados_70_79_m')
  final Map<int, double> confirmedAge70to79SexMale;

  @JsonKey(name: 'confirmados_80_plus_f')
  final Map<int, double> confirmedAge80plusFemale;

  @JsonKey(name: 'confirmados_80_plus_m')
  final Map<int, double> confirmedAge80plusMale;

  @JsonKey(name: 'sintomas_tosse')
  final Map<int, double> symptomsCough;

  @JsonKey(name: 'sintomas_febre')
  final Map<int, double> symptomsFever;

  @JsonKey(name: 'sintomas_dificuldade_respiratoria')
  final Map<int, double> symptomsBreathingDifficulties;

  @JsonKey(name: 'sintomas_cefaleia')
  final Map<int, double> symptomsHeadache;

  @JsonKey(name: 'sintomas_dores_musculares')
  final Map<int, double> symptomsMusclePain;

  @JsonKey(name: 'sintomas_fraqueza_generalizada')
  final Map<int, double> symptomsGeneralizedWeakness;

  @JsonKey(name: 'confirmados_f')
  final Map<int, double> confirmedSexFemale;

  @JsonKey(name: 'confirmados_m')
  final Map<int, double> confirmedSexMale;

  @JsonKey(name: 'obitos_arsnorte')
  final Map<int, double> deathsARSNorth;

  @JsonKey(name: 'obitos_arscentro')
  final Map<int, double> deathsARSCenter;

  @JsonKey(name: 'obitos_arslvt')
  final Map<int, double> deathsARSLVT;

  @JsonKey(name: 'obitos_alentejo')
  final Map<int, double> deathsARSAlentejo;

  @JsonKey(name: 'obitos_arsalgarve')
  final Map<int, double> deathsARSAlgarve;

  @JsonKey(name: 'obitos_acores')
  final Map<int, double> deathsARSAcores;

  @JsonKey(name: 'obitos_madeira')
  final Map<int, double> deathsARSMadeira;

  @JsonKey(name: 'obitos_estrangeiro')
  final Map<int, double> deathsARSForeign;

  @JsonKey(name: 'recuperados_arsnorte')
  final Map<int, double> recoveredARSNorth;

  @JsonKey(name: 'recuperados_arscentro')
  final Map<int, double> recoveredARSCenter;

  @JsonKey(name: 'recuperados_arslvt')
  final Map<int, double> recoveredARSLVT;

  @JsonKey(name: 'recuperados_alentejo')
  final Map<int, double> recoveredARSAlentejo;

  @JsonKey(name: 'recuperados_arsalgarve')
  final Map<int, double> recoveredARSAlgarve;

  @JsonKey(name: 'recuperados_acores')
  final Map<int, double> recoveredARSAcores;

  @JsonKey(name: 'recuperados_madeira')
  final Map<int, double> recoveredARSMadeira;

  @JsonKey(name: 'recuperados_estrangeiro')
  final Map<int, double> recoveredARSForeign;

  @JsonKey(name: 'obitos_0_9_f')
  final Map<int, double> deathsAge0to9SexFemale;

  @JsonKey(name: 'obitos_0_9_m')
  final Map<int, double> deathsAge0to9SexMale;

  @JsonKey(name: 'obitos_10_19_f')
  final Map<int, double> deathsAge10to19SexFemale;

  @JsonKey(name: 'obitos_10_19_m')
  final Map<int, double> deathsAge10to19SexMale;

  @JsonKey(name: 'obitos_20_29_f')
  final Map<int, double> deathsAge20to29SexFemale;

  @JsonKey(name: 'obitos_20_29_m')
  final Map<int, double> deathsAge20to29SexMale;

  @JsonKey(name: 'obitos_30_39_f')
  final Map<int, double> deathsAge30to39SexFemale;

  @JsonKey(name: 'obitos_30_39_m')
  final Map<int, double> deathsAge30to39SexMale;

  @JsonKey(name: 'obitos_40_49_f')
  final Map<int, double> deathsAge40to49SexFemale;

  @JsonKey(name: 'obitos_40_49_m')
  final Map<int, double> deathsAge40to49SexMale;

  @JsonKey(name: 'obitos_50_59_f')
  final Map<int, double> deathsAge50to59SexFemale;

  @JsonKey(name: 'obitos_50_59_m')
  final Map<int, double> deathsAge50to59SexMale;

  @JsonKey(name: 'obitos_60_69_f')
  final Map<int, double> deathsAge60to69SexFemale;

  @JsonKey(name: 'obitos_60_69_m')
  final Map<int, double> deathsAge60to69SexMale;

  @JsonKey(name: 'obitos_70_79_f')
  final Map<int, double> deathsAge70to79SexFemale;

  @JsonKey(name: 'obitos_70_79_m')
  final Map<int, double> deathsAge70to79SexMale;

  @JsonKey(name: 'obitos_80_plus_f')
  final Map<int, double> deathsAge80PlusFemale;

  @JsonKey(name: 'obitos_80_plus_m')
  final Map<int, double> deathsAge80PlusMale;

  @JsonKey(name: 'obitos_f')
  final Map<int, double> deathsFemale;

  @JsonKey(name: 'obitos_m')
  final Map<int, double> deathsMale;

  CovidStatusModel(
      this.dates,
      this.datesData,
      this.confirmed,
      this.confirmedARSNorth,
      this.confirmedARSCenter,
      this.confirmedARSLVT,
      this.confirmedAlentejo,
      this.confirmedARSAlgarve,
      this.confirmedAcores,
      this.confirmedMadeira,
      this.confirmedForeign,
      this.confirmedNew,
      this.recovered,
      this.deaths,
      this.hospitalized,
      this.hospitalizedUCI,
      this.waitingResults,
      this.suspects,
      this.surveillance,
      this.confirmedNumber,
      this.transmissionChains,
      this.transmissionChainsImported,
      this.confirmedAge0to9SexFemale,
      this.confirmedAge0to9SexMale,
      this.confirmedAge10to19SexFemale,
      this.confirmedAge10to19SexMale,
      this.confirmedAge20to29SexFemale,
      this.confirmedAge20to29SexMale,
      this.confirmedAge30to39SexFemale,
      this.confirmedAge30to39SexMale,
      this.confirmedAge40to49SexFemale,
      this.confirmedAge40to49SexMale,
      this.confirmedAge50to59SexFemale,
      this.confirmedAge50to59SexMale,
      this.confirmedAge60to69SexFemale,
      this.confirmedAge60to69SexMale,
      this.confirmedAge70to79SexFemale,
      this.confirmedAge70to79SexMale,
      this.confirmedAge80plusFemale,
      this.confirmedAge80plusMale,
      this.symptomsCough,
      this.symptomsFever,
      this.symptomsBreathingDifficulties,
      this.symptomsHeadache,
      this.symptomsMusclePain,
      this.symptomsGeneralizedWeakness,
      this.confirmedSexFemale,
      this.confirmedSexMale,
      this.deathsARSNorth,
      this.deathsARSCenter,
      this.deathsARSLVT,
      this.deathsARSAlentejo,
      this.deathsARSAlgarve,
      this.deathsARSAcores,
      this.deathsARSMadeira,
      this.deathsARSForeign,
      this.recoveredARSNorth,
      this.recoveredARSCenter,
      this.recoveredARSLVT,
      this.recoveredARSAlentejo,
      this.recoveredARSAlgarve,
      this.recoveredARSAcores,
      this.recoveredARSMadeira,
      this.recoveredARSForeign,
      this.deathsAge0to9SexFemale,
      this.deathsAge0to9SexMale,
      this.deathsAge10to19SexFemale,
      this.deathsAge10to19SexMale,
      this.deathsAge20to29SexFemale,
      this.deathsAge20to29SexMale,
      this.deathsAge30to39SexFemale,
      this.deathsAge30to39SexMale,
      this.deathsAge40to49SexFemale,
      this.deathsAge40to49SexMale,
      this.deathsAge50to59SexFemale,
      this.deathsAge50to59SexMale,
      this.deathsAge60to69SexFemale,
      this.deathsAge60to69SexMale,
      this.deathsAge70to79SexFemale,
      this.deathsAge70to79SexMale,
      this.deathsAge80PlusFemale,
      this.deathsAge80PlusMale,
      this.deathsFemale,
      this.deathsMale);

  /// Mapper from Json to Model
  factory CovidStatusModel.fromJson(Map<String, dynamic> json) =>
      _$CovidStatusModelFromJson(json);

  /// Maps Model to Json
  Map<String, dynamic> toJson() => _$CovidStatusModelToJson(this);
}
