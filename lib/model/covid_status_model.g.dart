// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covid_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CovidStatusModel _$CovidStatusModelFromJson(Map<String, dynamic> json) {
  return CovidStatusModel(
    (json['data'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), e as String),
    ),
    (json['data_dados'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), e as String),
    ),
    (json['confirmados'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['confirmados_arsnorte'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['confirmados_arscentro'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['confirmados_arslvt'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['confirmados_arsalentejo'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['confirmados_arsalgarve'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['confirmados_acores'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['confirmados_madeira'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['confirmados_estrangeiro'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['confirmados_novos'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['recuperados'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['obitos'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['internados'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['internados_uci'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['lab'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['suspeitos'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['vigilancia'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['n_confirmados'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['cadeias_transmissao'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['transmissao_importada'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['confirmados_0_9_f'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['confirmados_0_9_m'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['confirmados_10_19_f'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['confirmados_10_19_m'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['confirmados_20_29_f'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['confirmados_20_29_m'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['confirmados_30_39_f'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['confirmados_30_39_m'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['confirmados_40_49_f'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['confirmados_40_49_m'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['confirmados_50_59_f'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['confirmados_50_59_m'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['confirmados_60_69_f'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['confirmados_60_69_m'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['confirmados_70_79_f'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['confirmados_70_79_m'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['confirmados_80_plus_f'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['confirmados_80_plus_m'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['sintomas_tosse'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['sintomas_febre'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['sintomas_dificuldade_respiratoria'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['sintomas_cefaleia'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['sintomas_dores_musculares'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['sintomas_fraqueza_generalizada'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['confirmados_f'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['confirmados_m'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['obitos_arsnorte'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['obitos_arscentro'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['obitos_arslvt'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['obitos_arsalentejo'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['obitos_arsalgarve'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['obitos_acores'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['obitos_madeira'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['obitos_estrangeiro'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['recuperados_arsnorte'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['recuperados_arscentro'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['recuperados_arslvt'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['recuperados_arsalentejo'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['recuperados_arsalgarve'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['recuperados_acores'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['recuperados_madeira'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['recuperados_estrangeiro'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['obitos_0_9_f'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['obitos_0_9_m'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['obitos_10_19_f'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['obitos_10_19_m'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['obitos_20_29_f'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['obitos_20_29_m'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['obitos_30_39_f'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['obitos_30_39_m'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['obitos_40_49_f'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['obitos_40_49_m'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['obitos_50_59_f'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['obitos_50_59_m'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['obitos_60_69_f'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['obitos_60_69_m'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['obitos_70_79_f'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['obitos_70_79_m'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['obitos_80_plus_f'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['obitos_80_plus_m'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['obitos_f'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
    (json['obitos_m'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    ),
  );
}

Map<String, dynamic> _$CovidStatusModelToJson(CovidStatusModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'data', instance.dates?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('data_dados',
      instance.datesData?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('confirmados',
      instance.confirmed?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('confirmados_arsnorte',
      instance.confirmedARSNorth?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('confirmados_arscentro',
      instance.confirmedARSCenter?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('confirmados_arslvt',
      instance.confirmedARSLVT?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('confirmados_arsalentejo',
      instance.confirmedAlentejo?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('confirmados_arsalgarve',
      instance.confirmedARSAlgarve?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('confirmados_acores',
      instance.confirmedAcores?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('confirmados_madeira',
      instance.confirmedMadeira?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('confirmados_estrangeiro',
      instance.confirmedForeign?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('confirmados_novos',
      instance.confirmedNew?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('recuperados',
      instance.recovered?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull(
      'obitos', instance.deaths?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('internados',
      instance.hospitalized?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('internados_uci',
      instance.hospitalizedUCI?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull(
      'lab', instance.waitingResults?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull(
      'suspeitos', instance.suspects?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('vigilancia',
      instance.surveillance?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('n_confirmados',
      instance.confirmedNumber?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('cadeias_transmissao',
      instance.transmissionChains?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull(
      'transmissao_importada',
      instance.transmissionChainsImported
          ?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull(
      'confirmados_0_9_f',
      instance.confirmedAge0to9SexFemale
          ?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull(
      'confirmados_0_9_m',
      instance.confirmedAge0to9SexMale
          ?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull(
      'confirmados_10_19_f',
      instance.confirmedAge10to19SexFemale
          ?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull(
      'confirmados_10_19_m',
      instance.confirmedAge10to19SexMale
          ?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull(
      'confirmados_20_29_f',
      instance.confirmedAge20to29SexFemale
          ?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull(
      'confirmados_20_29_m',
      instance.confirmedAge20to29SexMale
          ?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull(
      'confirmados_30_39_f',
      instance.confirmedAge30to39SexFemale
          ?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull(
      'confirmados_30_39_m',
      instance.confirmedAge30to39SexMale
          ?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull(
      'confirmados_40_49_f',
      instance.confirmedAge40to49SexFemale
          ?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull(
      'confirmados_40_49_m',
      instance.confirmedAge40to49SexMale
          ?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull(
      'confirmados_50_59_f',
      instance.confirmedAge50to59SexFemale
          ?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull(
      'confirmados_50_59_m',
      instance.confirmedAge50to59SexMale
          ?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull(
      'confirmados_60_69_f',
      instance.confirmedAge60to69SexFemale
          ?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull(
      'confirmados_60_69_m',
      instance.confirmedAge60to69SexMale
          ?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull(
      'confirmados_70_79_f',
      instance.confirmedAge70to79SexFemale
          ?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull(
      'confirmados_70_79_m',
      instance.confirmedAge70to79SexMale
          ?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull(
      'confirmados_80_plus_f',
      instance.confirmedAge80plusFemale
          ?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull(
      'confirmados_80_plus_m',
      instance.confirmedAge80plusMale
          ?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('sintomas_tosse',
      instance.symptomsCough?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('sintomas_febre',
      instance.symptomsFever?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull(
      'sintomas_dificuldade_respiratoria',
      instance.symptomsBreathingDifficulties
          ?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('sintomas_cefaleia',
      instance.symptomsHeadache?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('sintomas_dores_musculares',
      instance.symptomsMusclePain?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull(
      'sintomas_fraqueza_generalizada',
      instance.symptomsGeneralizedWeakness
          ?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('confirmados_f',
      instance.confirmedSexFemale?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('confirmados_m',
      instance.confirmedSexMale?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('obitos_arsnorte',
      instance.deathsARSNorth?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('obitos_arscentro',
      instance.deathsARSCenter?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('obitos_arslvt',
      instance.deathsARSLVT?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('obitos_arsalentejo',
      instance.deathsARSAlentejo?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('obitos_arsalgarve',
      instance.deathsARSAlgarve?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('obitos_acores',
      instance.deathsARSAcores?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('obitos_madeira',
      instance.deathsARSMadeira?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('obitos_estrangeiro',
      instance.deathsARSForeign?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('recuperados_arsnorte',
      instance.recoveredARSNorth?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('recuperados_arscentro',
      instance.recoveredARSCenter?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('recuperados_arslvt',
      instance.recoveredARSLVT?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('recuperados_arsalentejo',
      instance.recoveredARSAlentejo?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('recuperados_arsalgarve',
      instance.recoveredARSAlgarve?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('recuperados_acores',
      instance.recoveredARSAcores?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('recuperados_madeira',
      instance.recoveredARSMadeira?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('recuperados_estrangeiro',
      instance.recoveredARSForeign?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull(
      'obitos_0_9_f',
      instance.deathsAge0to9SexFemale
          ?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('obitos_0_9_m',
      instance.deathsAge0to9SexMale?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull(
      'obitos_10_19_f',
      instance.deathsAge10to19SexFemale
          ?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull(
      'obitos_10_19_m',
      instance.deathsAge10to19SexMale
          ?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull(
      'obitos_20_29_f',
      instance.deathsAge20to29SexFemale
          ?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull(
      'obitos_20_29_m',
      instance.deathsAge20to29SexMale
          ?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull(
      'obitos_30_39_f',
      instance.deathsAge30to39SexFemale
          ?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull(
      'obitos_30_39_m',
      instance.deathsAge30to39SexMale
          ?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull(
      'obitos_40_49_f',
      instance.deathsAge40to49SexFemale
          ?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull(
      'obitos_40_49_m',
      instance.deathsAge40to49SexMale
          ?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull(
      'obitos_50_59_f',
      instance.deathsAge50to59SexFemale
          ?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull(
      'obitos_50_59_m',
      instance.deathsAge50to59SexMale
          ?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull(
      'obitos_60_69_f',
      instance.deathsAge60to69SexFemale
          ?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull(
      'obitos_60_69_m',
      instance.deathsAge60to69SexMale
          ?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull(
      'obitos_70_79_f',
      instance.deathsAge70to79SexFemale
          ?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull(
      'obitos_70_79_m',
      instance.deathsAge70to79SexMale
          ?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('obitos_80_plus_f',
      instance.deathsAge80PlusFemale?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('obitos_80_plus_m',
      instance.deathsAge80PlusMale?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('obitos_f',
      instance.deathsFemale?.map((k, e) => MapEntry(k.toString(), e)));
  writeNotNull('obitos_m',
      instance.deathsMale?.map((k, e) => MapEntry(k.toString(), e)));
  return val;
}
