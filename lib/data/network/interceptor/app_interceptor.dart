// part of data;
//
// class AppInterceptor extends QueuedInterceptorsWrapper {
//   final UserStorageRepository _tokenStorageRepository;
//   bool isRefreshing = false;
//   final Talker talker;
//   AppInterceptor(this._tokenStorageRepository, this.talker);
//
//   @override
//   Future<void> onRequest(
//       RequestOptions options,
//       RequestInterceptorHandler handler,
//       ) async {
//     options.headers.putIfAbsent(
//       'Accept',
//           () => 'application/json',
//     );
//     TokenDto? token = _tokenStorageRepository.getTokens();
//     if (token != null) {
//       options.headers.putIfAbsent(
//         'Authorization',
//             () => 'Bearer ${token.accessToken}',
//       );
//     }
//     super.onRequest(options, handler);
//   }
//
//   @override
//   Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
//     if (err.response != null) {
//       talker.error(err.response!);
//     }
//
//     String errMessage = 'Just Error )';
//     if (err.response?.data != null) {
//       errMessage = (err.response?.data as Map<dynamic, dynamic>)['message'];
//     }
//
//     switch (err.response?.statusCode) {
//       case 400:
//         super.onError(BadRequest(err.requestOptions, err.response, errMessage), handler);
//         break;
//       case 401:
//         await _refreshToken(err, handler);
//         // super.onError(Unauthorized(err.requestOptions, err.response, errMessage), handler);
//         break;
//       case 403:
//         super.onError(Unauthorized(err.requestOptions, err.response, errMessage), handler);
//         break;
//       case 404:
//         super.onError(NotFound(err.requestOptions, err.response, errMessage), handler);
//         break;
//       case 406:
//         super.onError(NotAcceptable(err.requestOptions, err.response, errMessage), handler);
//         break;
//       case 423:
//         super.onError(Locked(err.requestOptions, err.response, errMessage), handler);
//         break;
//       case 429:
//         super.onError(TooManyRequests(err.requestOptions, err.response, errMessage), handler);
//         break;
//       case 422:
//         super.onError(UnprocessableEntity(err.requestOptions, err.response, errMessage), handler);
//         break;
//       case 500:
//         super.onError(ServerUnavailable(err.requestOptions, err.response, errMessage), handler);
//         break;
//       case 503:
//         super.onError(ServerTemporarilyUnavailable(err.requestOptions, err.response, errMessage), handler);
//         break;
//       default:
//         super.onError(UnknownError(err.requestOptions, err.response, errMessage), handler);
//         break;
//     }
//   }
//
//   Future<void> _refreshToken(
//       DioException err,
//       ErrorInterceptorHandler handler,
//       ) async {
//     TokenDto? tokens = _tokenStorageRepository.getTokens();
//
//     if (isRefreshing) {
//       return handler.next(err);
//     }
//     if (tokens != null && tokens.refreshToken.isNotEmpty) {
//       try {
//         isRefreshing = true;
//         final Dio client = Dio(
//           BaseOptions(
//             baseUrl: CoreConstants.baseUrl,
//             connectTimeout: const Duration(milliseconds: 1000000),
//             receiveTimeout: const Duration(milliseconds: 1000000),
//             sendTimeout: const Duration(milliseconds: 1000000),
//           ),
//         );
//
//         client.options.headers.putIfAbsent(
//           'Accept',
//               () => 'application/json',
//         );
//
//         client.options.headers.putIfAbsent(
//           'Authorization',
//               () => 'Bearer ${tokens.refreshToken}',
//         );
//
//         final response = await client.post(CoreConstants.refresh, data: FormData.fromMap({
//           'device': 'phone',
//         }));
//
//         var newTokens = TokenDto.fromJson(response.data).convertModel();
//
//         await _tokenStorageRepository.saveToken(
//           TokenModel(
//             accessToken: newTokens.accessToken,
//             refreshToken: newTokens.refreshToken,
//           ),
//         );
//
//         RequestOptions options = err.response?.requestOptions ?? err.requestOptions;
//
//         final FormData? formData = options.data;
//         final newFormData = formData?.clone();
//         options.headers = ({'Authorization': 'Bearer ${newTokens.accessToken}', 'Accept': 'application/json'});
//         options.data = newFormData;
//
//         var result = await client.fetch(options);
//
//         isRefreshing = false;
//
//         handler.resolve(result);
//
//         return;
//       } on DioException catch (err) {
//         print('Refresh_token_error');
//         if (err.response?.statusCode != 429) {
//           await _tokenStorageRepository.deleteAccessToken();
//           await _tokenStorageRepository.deleteRefreshToken();
//           try {
//             var userService = getIt<UserDataService>();
//             userService.getActualUserModel();
//           } catch (e) {
//             talker.error(e);
//           }
//         } else {
//           talker.error('To many refresh request');
//         }
//         isRefreshing = false;
//         handler.reject(err);
//       } catch (error) {
//         isRefreshing = false;
//         rethrow;
//       }
//     } else {
//       return handler.next(err);
//     }
//   }
// }
