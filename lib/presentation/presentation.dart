library presentation;

import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:eventify/presentation/ui/screens/home/bloc/bloc.dart';
import 'package:eventify/presentation/ui/screens/home/bloc/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:eventify/core/extensions/int.dart';
import 'package:eventify/presentation/ui/base_widgets/action_button.dart';
import 'package:eventify/presentation/ui/base_widgets/base_input_field.dart';
import 'package:eventify/presentation/ui/screens/splash/bloc/bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../../core/extensions/image.dart';
import '../core/core.dart';
import '../resources/constants.dart';

export 'package:freezed_annotation/freezed_annotation.dart';
export 'package:injectable/injectable.dart';

// UI KIT

part '../presentation/ui/ui_kit/theme.dart';

part '../presentation/ui/ui_kit/selection_handler.dart';

part '../presentation/ui/ui_kit/colors.dart';

part '../presentation/ui/ui_kit/gradients.dart';

part '../presentation/ui/ui_kit/images.dart';

part '../presentation/ui/ui_kit/shadows.dart';

part '../presentation/ui/ui_kit/text_styles.dart';

// SCREEN COMPONENTS
part 'ui/screen_components/error_message.dart';

// CUSTOM WIDGETS
part 'ui/custom_widgets/custom_scroll_behavior.dart';

// BASE WIDGETS

part 'ui/base_widgets/base_add_file_button.dart';

part 'ui/base_widgets/base_asset_icon.dart';

part 'ui/base_widgets/base_bottom_dialog.dart';

part 'ui/base_widgets/base_bottom_navigation_bar.dart';

part 'ui/base_widgets/base_button.dart';

part 'ui/base_widgets/base_icon_background.dart';

part 'ui/base_widgets/base_ink_well.dart';

part 'ui/base_widgets/base_loading_indicator.dart';

part 'ui/base_widgets/base_profile_icon.dart';

part 'ui/base_widgets/base_progress_bar.dart';

part 'ui/base_widgets/base_scaffold.dart';

part 'ui/base_widgets/base_text_icon.dart';

part 'ui/base_widgets/gradient_text.dart';

part 'ui/base_widgets/base_dropdown.dart';
// SCREENS

part 'ui/screens/splash/splash.dart';

part 'ui/screens/events/events.dart';
part 'ui/screens/importExport/importExport.dart';

// NAVIGATION
part 'navigation/routes.dart';

//MODELS

part 'models/user.dart';

part 'models/media.dart';

// FORMS

part '../presentation/ui/screens/home/home.dart';

// UTILS
part 'utils/formatters.dart';

part 'utils/url_launcher.dart';

part 'utils/validators.dart';
