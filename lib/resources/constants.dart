enum AppTab { profile, support }

enum ProfileTabRoute { form, sent }

enum SupportTabRoute { form, sent }

const kAppLoadingDelay = Duration(seconds: 1);
const kAppProgressBarUpdateFrequency = Duration(milliseconds: 100);

abstract class AppDuration {
  static const conventional = Duration(seconds: 1);
  static const popDuration = Duration(milliseconds: 500);
}

class AppStorageKeys {
  static const token = 'token';
  static const userData = 'user_data';
  static const subscriptionData = 'subscription_data';
  static const onboardingPassed = 'onboarding_passed';
}

class AppAssets {
  static const appIcon = "assets/app_icons/icon4.png";
  static const appLogo = "$imagesFolder/app_logo1.png";
  static const splashIcon = "assets/app_icons/splash_icon.png";

  static const appBackground = "$imagesFolder/app_background.png";

  static const onboardingFolder = "assets/onboarding";
  static const imagesFolder = "assets/img";
  static const iconsFolder = "assets/icons";

  // MARK: - onboarding

  static const onboardingBackground = "$onboardingFolder/0.png";

  static const first = "$onboardingFolder/01.png";
  static const second = "$onboardingFolder/02.png";
  static const third = "$onboardingFolder/03.png";
  static const fourth = "$onboardingFolder/04.png";
  static const fifth = "$onboardingFolder/05.png";
  static const auth = "$onboardingFolder/auth.png";

  // MARK: - icons

  static const home = "$iconsFolder/home.svg";
  static const wallet = '$iconsFolder/wallet.svg';
  static const walletAdd = "$iconsFolder/wallet_add.svg";
  static const payments = "$iconsFolder/payments.svg";
  static const camera = "$iconsFolder/camera.svg";
  static const favoriteOn = "$iconsFolder/heart_on.svg";
  static const favoriteOff = "$iconsFolder/heart_off.svg";
  static const user = "$iconsFolder/user.svg";

  static const like = "$iconsFolder/like.svg";
  static const dislike = "$iconsFolder/dislike.svg";
  static const comment = "$iconsFolder/comment.svg";

  static const edit = "$iconsFolder/edit.svg";
  static const check = "$iconsFolder/check.svg";
  static const rightArrow = "$iconsFolder/right_arrow.svg";
  static const backArrow = "$iconsFolder/back_arrow.svg";
  static const openArrow = "$iconsFolder/open_arrow.svg";

  static const search = "$iconsFolder/search.svg";
  static const close = "$iconsFolder/close.svg";
  static const closeCircle = "$iconsFolder/close_circle.svg";


  static const sendMessage = "$iconsFolder/send_message.svg";
  static const addPhoto = "$iconsFolder/add_photo.svg";
  static const removePhoto = "$iconsFolder/remove.svg";
  static const removeMessage = "$iconsFolder/remove_message.svg";

  static const smile = "$iconsFolder/smile.svg";
  static const quote = "$iconsFolder/quote.svg";
  static const logout = "$iconsFolder/logout.svg";

  static const chatOff = "$iconsFolder/chat_off.svg";

  static const more = "$iconsFolder/more.svg";
  static const moreBlack = "$iconsFolder/more_black.svg";

  // MARK: - images

  static const carPlaceholder = "$imagesFolder/car_placeholder.svg"; // example
  static const carPlaceholder2 = "$imagesFolder/car_placeholder2.png"; // example
}

class AppTextIcons {
  static const link = "􀉣";
  static const chevronForward = "􀆊";
  static const secured = "􀞜";
  static const done = "􀆅";
  static const checkboxSelected = "􀃳";
  static const checkboxDeselected = "􀂒";
  static const settings = "􀍟";
  static const key = "􀟖";
  static const edit = "􀈊";
  static const email = "􀍜";
  static const add = "􀅼";
  static const addProfile = "􀜖";
  static const location = "􀎫";
  static const calendar = "􀧞";
  static const emailNotification = "􀍛";
  static const calendarNotification = "􀮝";
  static const closed = "􀁡";
  static const home = "􀎟";
  static const profile = "􀉪";
  static const support = "􀌥";
  static const delete = "􀈒";
}