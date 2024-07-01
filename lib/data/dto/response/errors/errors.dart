part of data;

@JsonSerializable()
class ErrorsDto {
  final List<ErrorDto> errors;

  const ErrorsDto({
    required this.errors,
  });

  factory ErrorsDto.fromJson(Map<String, dynamic> json) => _$ErrorsDtoFromJson(json);
}
