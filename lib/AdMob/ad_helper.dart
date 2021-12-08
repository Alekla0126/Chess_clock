import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-7382185127986341/3984652553';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-7382185127986341~6307563567';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }
}
