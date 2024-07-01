part of splash_bloc;

@freezed
class SplashEvent with _$SplashEvent {
  const factory SplashEvent.init() = InitEvent;
  const factory SplashEvent.done() = DoneEvent;
}