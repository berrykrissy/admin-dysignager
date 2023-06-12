import 'dart:ui';

import 'package:signage/utils/hex_color.dart';

class Constants {
  static const TIMEOUT = 10000;
  static const BLANK = " ";
  static const CITY = "Manila";

  static const ONLINE = "Online";
  static const OUT_OF_SYNC = "Out of Sync";
  static const OFFLINE = "Offline";
  static const DISABLED = "Disabled";
  static const PUBLISHED = "Published";
  static const UNPUBLISHED = "Unpublised";

  static Color GREEN_ONLINE = HexColor('34A753');
  static Color RED_OUT_OF_SYNC = HexColor('EE695E');
  static Color GRAY_OFFLINE = HexColor('D1D1D1');
  static Color BLUE_DISABLED = HexColor('95B9F4');
  static Color PURPLE = HexColor('9500E6');

  static String FIND_SCREEN = "Find Screen";
  static String SCREENS = "Screens";
  static String CONTENTS = "Contents";
  static String SETTINGS = "Settings";
  static String LOGOUT = "Logout";

  static String PHOTO = "Photo";
  static String VIDEO = "Video";
}