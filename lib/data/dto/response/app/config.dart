part of data;

@JsonSerializable()
class ConfigDto {
  final String broadcaster;

  final String key;

  final String cluster;

  final bool encrypted;

  final String wsHost;

  final String wsPort;

  final String wssPort;

  final bool forceTLS;

  final bool disableStats;

  final List<String> enabledTransports;

  const ConfigDto(
      {required this.broadcaster,
      required this.key,
      required this.cluster,
      required this.encrypted,
      required this.wsHost,
      required this.wsPort,
      required this.wssPort,
      required this.forceTLS,
      required this.disableStats,
      required this.enabledTransports});

  factory ConfigDto.fromJson(Map<String, dynamic> json) => _$ConfigDtoFromJson(json);
}
