// part of data;
//
// abstract class AppRepository {
//   Future<ConfigDto> getAppConfig();
// }
//
// @Injectable(as: AppRepository)
// class AppRepositoryImpl implements AppRepository {
//   final AppConfigService service;
//
//   AppRepositoryImpl(this.service);
//
//   @override
//   Future<ConfigDto> getAppConfig() async {
//     final response = await service.getAppConfig();
//     return response;
//   }
// }
