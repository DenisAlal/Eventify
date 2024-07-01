part of core;

extension ExceptionExtension on Exception {
  String get errorMessage {
    switch (runtimeType) {
      case DioException:
      // if ((this as DioException).error is Exception) {
      //   return ((this as DioException).error as Exception).message;
      // }

        switch ((this as DioException).response?.statusCode) {
          case 400:
          case 401:
            List<String> body = [];

            final message = (this as DioException).response?.data;

            if (message is Map) {
              for (var value in message.values) {
                if (value is Map) {
                  body.addAll(value.values.map((e) => e.toString()));
                }
              }
            }

            return body.isNotEmpty ? body.join("\n") : "Ошибка авторизации";

          case null:
            return (this as DioException).message ?? toString();
        // "Неизвестная ошибка в запросе";

          default:
            return (this as DioException).message ??
                "Код ${((this as DioException).response!.statusCode!)}";
        }

      default:
        return toString().replaceAll("Exception:", "").trim();
    }
  }
}
