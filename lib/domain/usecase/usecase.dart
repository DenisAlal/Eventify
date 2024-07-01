part of domain;

abstract class UseCase<ReturnType, Params> {
  Future<ReturnType> call(Params params);
}

@Freezed()
class NoParams with _$NoParams {
  const factory NoParams() = _NoParams;
}
