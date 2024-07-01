library data;

import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:injectable/injectable.dart';
import '../../../core/di/injection.dart';
import '../../core/core.dart';
import '../core/utils/generic_result.dart';
import '../domain/domain.dart';
import '../presentation/presentation.dart';
import 'network/models/pagination.dart';
part 'storage/local_storage/entity/app_config.dart';
part 'storage/local_storage/entity/entity.dart';
part 'storage/local_storage/entity/media.dart';
part 'storage/local_storage/entity/user.dart';
part 'repository/local_storage/app_config_storage_repository.dart';
// request


// response


part 'dto/response/errors/error.dart';

part '../data/dto/response/errors/errors.dart';

part '../data/dto/response/pagination.dart';

part 'dto/response/app/config.dart';

part 'data.g.dart';
