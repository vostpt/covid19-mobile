// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covid_status_last_updated_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CovidStatusLastUpdatedModel _$CovidStatusLastUpdatedModelFromJson(
    Map<String, dynamic> json) {
  return CovidStatusLastUpdatedModel(
    json['data'] as String,
    json['data_dados'] as String,
    (json['confirmados'] as num)?.toDouble(),
    (json['confirmados_arsnorte'] as num)?.toDouble(),
    (json['confirmados_arscentro'] as num)?.toDouble(),
    (json['confirmados_arslvt'] as num)?.toDouble(),
    (json['confirmados_alentejo'] as num)?.toDouble(),
    (json['confirmados_arsalgarve'] as num)?.toDouble(),
    (json['confirmados_acores'] as num)?.toDouble(),
    (json['confirmados_madeira'] as num)?.toDouble(),
    (json['confirmados_estrangeiro'] as num)?.toDouble(),
    (json['confirmados_novos'] as num)?.toDouble(),
    (json['recuperados'] as num)?.toDouble(),
    (json['obitos'] as num)?.toDouble(),
    (json['internados'] as num)?.toDouble(),
    (json['internados_uci'] as num)?.toDouble(),
    (json['lab'] as num)?.toDouble(),
    (json['suspeitos'] as num)?.toDouble(),
    (json['vigilancia'] as num)?.toDouble(),
    (json['n_confirmados'] as num)?.toDouble(),
    (json['cadeias_transmissao'] as num)?.toDouble(),
    (json['transmissao_importada'] as num)?.toDouble(),
    (json['confirmados_0_9_f'] as num)?.toDouble(),
    (json['confirmados_0_9_m'] as num)?.toDouble(),
    (json['confirmados_10_19_f'] as num)?.toDouble(),
    (json['confirmados_10_19_m'] as num)?.toDouble(),
    (json['confirmados_20_29_f'] as num)?.toDouble(),
    (json['confirmados_20_29_m'] as num)?.toDouble(),
    (json['confirmados_30_39_f'] as num)?.toDouble(),
    (json['confirmados_30_39_m'] as num)?.toDouble(),
    (json['confirmados_40_49_f'] as num)?.toDouble(),
    (json['confirmados_40_49_m'] as num)?.toDouble(),
    (json['confirmados_50_59_f'] as num)?.toDouble(),
    (json['confirmados_50_59_m'] as num)?.toDouble(),
    (json['confirmados_60_69_f'] as num)?.toDouble(),
    (json['confirmados_60_69_m'] as num)?.toDouble(),
    (json['confirmados_70_79_f'] as num)?.toDouble(),
    (json['confirmados_70_79_m'] as num)?.toDouble(),
    (json['confirmados_80_plus_f'] as num)?.toDouble(),
    (json['confirmados_80_plus_m'] as num)?.toDouble(),
    (json['sintomas_tosse'] as num)?.toDouble(),
    (json['sintomas_febre'] as num)?.toDouble(),
    (json['sintomas_dificuldade_respiratoria'] as num)?.toDouble(),
    (json['sintomas_cefaleia'] as num)?.toDouble(),
    (json['sintomas_dores_musculares'] as num)?.toDouble(),
    (json['sintomas_fraqueza_generalizada'] as num)?.toDouble(),
    (json['confirmados_f'] as num)?.toDouble(),
    (json['confirmados_m'] as num)?.toDouble(),
    (json['obitos_arsnorte'] as num)?.toDouble(),
    (json['obitos_arscentro'] as num)?.toDouble(),
    (json['obitos_arslvt'] as num)?.toDouble(),
    (json['obitos_alentejo'] as num)?.toDouble(),
    (json['obitos_arsalgarve'] as num)?.toDouble(),
    (json['obitos_acores'] as num)?.toDouble(),
    (json['obitos_madeira'] as num)?.toDouble(),
    (json['obitos_estrangeiro'] as num)?.toDouble(),
    (json['recuperados_arsnorte'] as num)?.toDouble(),
    (json['recuperados_arscentro'] as num)?.toDouble(),
    (json['recuperados_arslvt'] as num)?.toDouble(),
    (json['recuperados_alentejo'] as num)?.toDouble(),
    (json['recuperados_arsalgarve'] as num)?.toDouble(),
    (json['recuperados_acores'] as num)?.toDouble(),
    (json['recuperados_madeira'] as num)?.toDouble(),
    (json['recuperados_estrangeiro'] as num)?.toDouble(),
    (json['obitos_0_9_f'] as num)?.toDouble(),
    (json['obitos_0_9_m'] as num)?.toDouble(),
    (json['obitos_10_19_f'] as num)?.toDouble(),
    (json['obitos_10_19_m'] as num)?.toDouble(),
    (json['obitos_20_29_f'] as num)?.toDouble(),
    (json['obitos_20_29_m'] as num)?.toDouble(),
    (json['obitos_30_39_f'] as num)?.toDouble(),
    (json['obitos_30_39_m'] as num)?.toDouble(),
    (json['obitos_40_49_f'] as num)?.toDouble(),
    (json['obitos_40_49_m'] as num)?.toDouble(),
    (json['obitos_50_59_f'] as num)?.toDouble(),
    (json['obitos_50_59_m'] as num)?.toDouble(),
    (json['obitos_60_69_f'] as num)?.toDouble(),
    (json['obitos_60_69_m'] as num)?.toDouble(),
    (json['obitos_70_79_f'] as num)?.toDouble(),
    (json['obitos_70_79_m'] as num)?.toDouble(),
    (json['obitos_80_plus_f'] as num)?.toDouble(),
    (json['obitos_80_plus_m'] as num)?.toDouble(),
    (json['obitos_f'] as num)?.toDouble(),
    (json['obitos_m'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$CovidStatusLastUpdatedModelToJson(
    CovidStatusLastUpdatedModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.dates);
  writeNotNull('data_dados', instance.datesData);
  writeNotNull('confirmados', instance.confirmed);
  writeNotNull('confirmados_arsnorte', instance.confirmedARSNorth);
  writeNotNull('confirmados_arscentro', instance.confirmedARSCenter);
  writeNotNull('confirmados_arslvt', instance.confirmedARSLVT);
  writeNotNull('confirmados_alentejo', instance.confirmedAlentejo);
  writeNotNull('confirmados_arsalgarve', instance.confirmedARSAlgarve);
  writeNotNull('confirmados_acores', instance.confirmedAcores);
  writeNotNull('confirmados_madeira', instance.confirmedMadeira);
  writeNotNull('confirmados_estrangeiro', instance.confirmedForeign);
  writeNotNull('confirmados_novos', instance.confirmedNew);
  writeNotNull('recuperados', instance.recovered);
  writeNotNull('obitos', instance.deaths);
  writeNotNull('internados', instance.hospitalized);
  writeNotNull('internados_uci', instance.hospitalizedUCI);
  writeNotNull('lab', instance.waitingResults);
  writeNotNull('suspeitos', instance.suspects);
  writeNotNull('vigilancia', instance.surveillance);
  writeNotNull('n_confirmados', instance.confirmedNumber);
  writeNotNull('cadeias_transmissao', instance.transmissionChains);
  writeNotNull('transmissao_importada', instance.transmissionChainsImported);
  writeNotNull('confirmados_0_9_f', instance.confirmedAge0to9SexFemale);
  writeNotNull('confirmados_0_9_m', instance.confirmedAge0to9SexMale);
  writeNotNull('confirmados_10_19_f', instance.confirmedAge10to19SexFemale);
  writeNotNull('confirmados_10_19_m', instance.confirmedAge10to19SexMale);
  writeNotNull('confirmados_20_29_f', instance.confirmedAge20to29SexFemale);
  writeNotNull('confirmados_20_29_m', instance.confirmedAge20to29SexMale);
  writeNotNull('confirmados_30_39_f', instance.confirmedAge30to39SexFemale);
  writeNotNull('confirmados_30_39_m', instance.confirmedAge30to39SexMale);
  writeNotNull('confirmados_40_49_f', instance.confirmedAge40to49SexFemale);
  writeNotNull('confirmados_40_49_m', instance.confirmedAge40to49SexMale);
  writeNotNull('confirmados_50_59_f', instance.confirmedAge50to59SexFemale);
  writeNotNull('confirmados_50_59_m', instance.confirmedAge50to59SexMale);
  writeNotNull('confirmados_60_69_f', instance.confirmedAge60to69SexFemale);
  writeNotNull('confirmados_60_69_m', instance.confirmedAge60to69SexMale);
  writeNotNull('confirmados_70_79_f', instance.confirmedAge70to79SexFemale);
  writeNotNull('confirmados_70_79_m', instance.confirmedAge70to79SexMale);
  writeNotNull('confirmados_80_plus_f', instance.confirmedAge80plusFemale);
  writeNotNull('confirmados_80_plus_m', instance.confirmedAge80plusMale);
  writeNotNull('sintomas_tosse', instance.symptomsCough);
  writeNotNull('sintomas_febre', instance.symptomsFever);
  writeNotNull('sintomas_dificuldade_respiratoria',
      instance.symptomsBreathingDifficulties);
  writeNotNull('sintomas_cefaleia', instance.symptomsHeadache);
  writeNotNull('sintomas_dores_musculares', instance.symptomsMusclePain);
  writeNotNull(
      'sintomas_fraqueza_generalizada', instance.symptomsGeneralizedWeakness);
  writeNotNull('confirmados_f', instance.confirmedSexFemale);
  writeNotNull('confirmados_m', instance.confirmedSexMale);
  writeNotNull('obitos_arsnorte', instance.deathsARSNorth);
  writeNotNull('obitos_arscentro', instance.deathsARSCenter);
  writeNotNull('obitos_arslvt', instance.deathsARSLVT);
  writeNotNull('obitos_alentejo', instance.deathsARSAlentejo);
  writeNotNull('obitos_arsalgarve', instance.deathsARSAlgarve);
  writeNotNull('obitos_acores', instance.deathsARSAcores);
  writeNotNull('obitos_madeira', instance.deathsARSMadeira);
  writeNotNull('obitos_estrangeiro', instance.deathsARSForeign);
  writeNotNull('recuperados_arsnorte', instance.recoveredARSNorth);
  writeNotNull('recuperados_arscentro', instance.recoveredARSCenter);
  writeNotNull('recuperados_arslvt', instance.recoveredARSLVT);
  writeNotNull('recuperados_alentejo', instance.recoveredARSAlentejo);
  writeNotNull('recuperados_arsalgarve', instance.recoveredARSAlgarve);
  writeNotNull('recuperados_acores', instance.recoveredARSAcores);
  writeNotNull('recuperados_madeira', instance.recoveredARSMadeira);
  writeNotNull('recuperados_estrangeiro', instance.recoveredARSForeign);
  writeNotNull('obitos_0_9_f', instance.deathsAge0to9SexFemale);
  writeNotNull('obitos_0_9_m', instance.deathsAge0to9SexMale);
  writeNotNull('obitos_10_19_f', instance.deathsAge10to19SexFemale);
  writeNotNull('obitos_10_19_m', instance.deathsAge10to19SexMale);
  writeNotNull('obitos_20_29_f', instance.deathsAge20to29SexFemale);
  writeNotNull('obitos_20_29_m', instance.deathsAge20to29SexMale);
  writeNotNull('obitos_30_39_f', instance.deathsAge30to39SexFemale);
  writeNotNull('obitos_30_39_m', instance.deathsAge30to39SexMale);
  writeNotNull('obitos_40_49_f', instance.deathsAge40to49SexFemale);
  writeNotNull('obitos_40_49_m', instance.deathsAge40to49SexMale);
  writeNotNull('obitos_50_59_f', instance.deathsAge50to59SexFemale);
  writeNotNull('obitos_50_59_m', instance.deathsAge50to59SexMale);
  writeNotNull('obitos_60_69_f', instance.deathsAge60to69SexFemale);
  writeNotNull('obitos_60_69_m', instance.deathsAge60to69SexMale);
  writeNotNull('obitos_70_79_f', instance.deathsAge70to79SexFemale);
  writeNotNull('obitos_70_79_m', instance.deathsAge70to79SexMale);
  writeNotNull('obitos_80_plus_f', instance.deathsAge80PlusFemale);
  writeNotNull('obitos_80_plus_m', instance.deathsAge80PlusMale);
  writeNotNull('obitos_f', instance.deathsFemale);
  writeNotNull('obitos_m', instance.deathsMale);
  return val;
}
