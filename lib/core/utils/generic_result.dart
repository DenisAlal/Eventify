
class Result<V> {

  Result.success(this._value);

  Result.failure(this._failure);

  V? _value;

  Failure? _failure;

  V? get value => _value;

  Failure? get failure => _failure;

  dynamic get failureValue => _failure?.value;

  V? get valueOrThrow {
    if (isFailure) throw _failure!;
    if (_value == null) return null;
    return _value;
  }

  bool get isSuccess => _failure == null;

  bool get isFailure => _value == null;

  void onSuccess(Function(V? value) action) {
    if (isSuccess) action(_value);
  }

  void onFailure(Function(dynamic value) action) {
    if (isFailure) action(_failure);
  }

  T join<T>(
      T Function(V? value) onSuccess,
      T Function(Failure? failure) onFailure,
      ) {
    if (isSuccess) return onSuccess(value);

    return onFailure(failure);
  }

  @override
  String toString() {
    if (isFailure) return failure.toString();

    return 'Success: $value';
  }
}

class Failure {
  Failure(this.value, [this.message]);

  final dynamic value;

  final String? message;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    return other is Failure && value == other.value;
  }

  @override
  String toString() => 'Failure: { $value } with message: ${message ?? 'Unhandled exception'}';
}
