part of core;

abstract class BaseBloc<E, S> extends Bloc<E, S> implements ErrorHandler {
  final talker = getIt.get<Talker>();

  BaseBloc(S initialState) : super(initialState);

  EventTransformer<E> eventTransformer() => sequential<E>();

  @override
  void handleError(
    Object error,
    StackTrace stackTrace,
    Function(BaseError) onError, {
    bool onlyLog = false,
  }) {
    if (error is BaseException) {
      talker.error(
        'Error in BLoC $runtimeType , type: $error , Message: ${error.errMessage} ',
        error,
        stackTrace,
      );
    } else {
      talker.error(
        'Error in BLoC $runtimeType',
        error,
        stackTrace,
      );
    }

    if (!onlyLog) {
      print('Error!: ${error}'); // TODO add logger
      onError(getError(error));
    }
  }

  BaseError getError(dynamic error) {
    if (error is NoInternetConnection) {
      return BaseError(ErrorType.noInternetConnection,
          message: error.errMessage);
    } else if (error is Unauthorized) {
      return BaseError(
        ErrorType.unauthorized,
        message: error.errMessage,
      );
    } else if (error is NotFound) {
      return BaseError(ErrorType.notFound);
    } else if (error is ServerUnavailable ||
        error is ServerTemporarilyUnavailable) {
      return BaseError(ErrorType.serverUnavailable);
    } else if (error is TooManyRequests) {
      return BaseError(ErrorType.tooManyRequests, message: error.retryAfter);
    } else if (error is NotAcceptable) {
      return BaseError(
        ErrorType.notAcceptable,
        message: error.message,
      );
    } else if (error is UnprocessableEntity) {
      return BaseError(ErrorType.unprocessableEntity,
          message: error.errMessage);
    } else if (error is BadRequest) {
      return BaseError(ErrorType.badRequest, message: error.errMessage);
    } else {
      return BaseError(ErrorType.unknown);
    }
  }
}

abstract class ErrorHandler {
  void handleError(
    Object error,
    StackTrace stackTrace,
    Function(BaseError) onError,
  );
}

enum BaseStatus { initial, loading, error, success }

extension BaseStatusExtension on BaseStatus {
  bool get isSuccess => this == BaseStatus.success;

  bool get isLoading => this == BaseStatus.loading;

  bool get isInitial => this == BaseStatus.initial;

  bool get isError => this == BaseStatus.error;
}

// abstract class BaseState {
//   final BaseStatus status;
//   final BaseError? baseError;
//
//   const BaseState({required this.status, this.baseError});
//
//   bool get error => status.isError;
//
//   bool get loading => status.isLoading;
//
//   bool get success => status.isSuccess;
//
//   bool get initial => status.isInitial;
// }

class BaseError {
  final ErrorType errorType;
  final String? message;

  BaseError(
    this.errorType, {
    this.message,
  });
}

enum ErrorType {
  noInternetConnection,
  unauthorized,
  notFound,
  serverUnavailable,
  tooManyRequests,
  badRequest,
  unprocessableEntity,
  notAcceptable,
  unknown,
}

extension BaseErrorExtension on BaseError? {
  bool get isNoInternetConnection =>
      this?.errorType == ErrorType.noInternetConnection;

  bool get isUnauthorized => this?.errorType == ErrorType.unauthorized;

  bool get isNotFound => this?.errorType == ErrorType.notFound;

  bool get isServerUnavailable =>
      this?.errorType == ErrorType.serverUnavailable;

  bool get isTooManyRequests => this?.errorType == ErrorType.tooManyRequests;

  bool get isBadRequest => this?.errorType == ErrorType.badRequest;

  bool get isUnprocessableEntity =>
      this?.errorType == ErrorType.unprocessableEntity;

  bool get isUnknown => this?.errorType == ErrorType.unknown;
}
