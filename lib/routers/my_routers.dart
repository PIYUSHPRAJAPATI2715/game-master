import 'package:get/get_navigation/src/routes/get_route.dart';

import '../bottom_nav_bar.dart';
import '../screens/Withdraw_popup.dart';
import '../screens/add_cash_screne.dart';
import '../screens/add_withDrew.dart';
import '../screens/blue_popup.dart';
import '../screens/red_add_money_popup.dart';
import '../screens/admin_seting.dart';
import '../screens/betting_setting.dart';
import '../screens/first_page.dart';
import '../screens/fourth_screen.dart';
import '../screens/my_profile_screen.dart';
import '../screens/second_page.dart';
import '../screens/signin_scren.dart';
import '../screens/signup_page.dart';
import '../screens/splash1.dart';
import '../screens/third_page.dart';
import '../screens/tie_popup.dart';
import '../screens/transistion_page.dart';
import '../screens/withdrawl_request.dart';


class MyRouters{
  static var signInPage = "/signInPage";
  static var splash = "/splash";
  static var signupPage = "/signupPage";
  static var withdrawlPage = "/withdrawlPage";
  static var firstPage = "/firstPage";
  static var secondPage = "/secondPage";
  static var thirdPage = "/thirdPage";
  static var fourthPage = "/fourthPage";
  static var addMoneyPopup = "/addMoneyPopup";
  static var profileScreen = "/profileScreen";
  static var transistonPage = "/transistonPage";
  static var adminSetting = "/adminSetting";
  static var bettingSetting = "/bettingSetting";
  static var blueAddMoneyPopup = "/blueAddMoneyPopup";
  static var tieAddMoneyPopup = "/tieAddMoneyPopup";
  static var withDrawPopup = "/withDrawPopup";
  static var addWithDraw = "/addWithDraw";
  static var addCash = "/addCash";
  static var route = [
 GetPage(name: '/', page: () =>  const Splash()),
 GetPage(name: '/signInPage', page: () =>  const SignInPage()),
 GetPage(name: '/addCash', page: () =>  const AddCash()),
 GetPage(name: '/addWithDraw', page: () =>  const AddWithDraw()),
 GetPage(name: '/signupPage', page: () =>  const SignupPage()),
 GetPage(name: '/withDrawPopup', page: () =>  const WithDrawPopup()),
 GetPage(name: '/firstPage', page: () =>  const FirstPage()),
    GetPage(name: '/transistonPage', page: () =>  const TransistonPage()),
 GetPage(name: '/secondPage', page: () =>  const SecondPage()),
    GetPage(name: '/profileScreen', page: () =>  const ProfileScreen()),
    GetPage(name: '/adminSetting', page: () =>  const AdminSetting()),
    GetPage(name: '/bettingSetting', page: () =>  const BettingSetting()),
    GetPage(name: '/blueAddMoneyPopup', page: () =>  const BlueAddMoneyPopup()),
    GetPage(name: '/tieAddMoneyPopup', page: () =>  const TieAddMoneyPopup()),

 GetPage(name: '/thirdPage', page: () =>  const ThirdPage()),
 GetPage(name: '/fourthPage', page: () =>  const FourthPage()),
 GetPage(name: '/addMoneyPopup', page: () =>  const AddMoneyPopup()),
 GetPage(name: '/withdrawlPage', page: () =>  const WithdrawlPage()),



  ];
}