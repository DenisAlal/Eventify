part of core;

abstract class CoreConstants {
  // static const baseUrl = 'https://main.nomer.app/api/v1';
  // static const wsBaseUrl = 'https://main.nomer.app';
  // DEBUG BLOC
  static const blocPrintCreations = true;
  static const blocPrintClosings = true;
  static const blocPrintStateFullData = true;


  // DEBUG DIO
  static const showRequestHeaders = true;
  static const showRequestData = true;
  static const showResponseHeaders = true;
  static const showFullResponseData = false;



  static const baseUrl = 'https://nomerapp.rand-agency.dev/api/v1';
  static const wsBaseUrl = 'https://nomerapp.rand-agency.dev';

  static const privacyPolicy = "https://nomer.app/privacy";
  static const termsOfUse = "https://nomer.app/privacy";
  static const cite = "https://nomer.app";

  static const auth = '/auth';
  static const register = '$auth/register';
  static const login = '$auth/login';
  static const confirmationCode = '$auth/confirmation-code';
  static const loginByPhone = '$auth/login-by-phone';
  static const logout = '$auth/logout';
  static const refresh = '$auth/refresh';

  static const user = '/user';
  static const setPosition = '$user/set-position';
  static const attachAvatar = '$user/avatar/attach';
  static const detachAvatar = '$user/avatar/detach';

  static const favorite = '/favorite';
  static const favoriteCars = '$user/$favorite/cars';
  static const favoriteCarsAttach = 'attach';
  static const favoriteCarsDetach = 'detach';
  static const favoriteCarsPin = 'pin';
  static const favoriteCarsUnpin = 'unpin';

  static const like = '/like';
  static const dislike = '/dislike';
  static const likeCar = '$user/$like/cars';
  static const dislikeCar = '$user/$dislike/cars';

  static const cars = '/cars';
  static const numberDetect = '$cars/number-detect';
  static const numberValidate = '$cars/number-validate';
  static const carPhotosAttach = '/photos/attach';
  static const carPhotosDetach = '/photos/detach';

  static const complaint = '/complaint';

  static const chat = '/chat';
  static const nearest = '$chat/nearest';
  static const current = '$chat/current';

  static const config = '/app/config';


}
