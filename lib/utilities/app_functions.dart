import '../models/platforms_model.dart';

class AppFunctions {
  static List<String> setPlatformIcons(List<ParentPlatforms> platforms) {
    List<String> svgs = [];
    for (ParentPlatforms platform in platforms) {
      switch (platform.platform?.id) {
        case (1):
          svgs.add('assets/img/platforms/windows.svg');
          break;
        case (2):
          svgs.add('assets/img/platforms/playstation.svg');
          break;
        case (3):
          svgs.add('assets/img/platforms/xbox.svg');
          break;
        case (4):
          svgs.add('assets/img/platforms/ios-mac.svg');
          break;
        case (7):
          svgs.add('assets/img/platforms/nintendo.svg');
          break;
        case (8):
          svgs.add('assets/img/platforms/android.svg');
          break;
        case (11):
          svgs.add('assets/img/platforms/sega.svg');
          break;
      }
    }
    return svgs;
  }
}