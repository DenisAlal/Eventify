part of data;

@JsonSerializable()
class ErrorDto {
  final String message;
  final String fileName;

  const ErrorDto({
    required this.message,
    required this.fileName,
  });

  factory ErrorDto.fromJson(Map<String, dynamic> json) => _$ErrorDtoFromJson(json);
}
