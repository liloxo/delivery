import 'package:delivery/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:delivery/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:delivery/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:delivery/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:delivery/view/screen/auth/login.dart';
import 'package:delivery/view/screen/auth/signup.dart';
import 'package:delivery/view/screen/auth/success_signup.dart';
import 'package:delivery/view/screen/auth/verificationcodesignup.dart';
import 'package:delivery/view/screen/homescreen.dart';
import 'package:delivery/view/screen/language.dart';
import 'package:delivery/view/screen/onboarding.dart';
import 'package:delivery/view/screen/orders/details.dart';
import 'package:delivery/view/screen/orders/tracking.dart';
import 'package:get/get.dart';
import 'core/middleware/mymiddleware.dart';

List<GetPage<dynamic>> routes = [
  GetPage(name: "/",                     page: () => const Language(),middlewares: [MyMiddleWare()]),
  GetPage(name: "/login",                page: () => const Login()),
  GetPage(name: "/signup",               page: () => const SignUp()),
  GetPage(name: "/forgetpassword",       page: () => const ForgetPassword()),
  GetPage(name: "/verifycode",           page: () => const VerifyCode()),
  GetPage(name: "/resetpassword",        page: () => const ResetPassword()),
  GetPage(name: "/successresetpassword", page: () => const SuccessResetPassword()),
  GetPage(name: "/successsignup",        page: () => const SuccessSignUp()),
  GetPage(name: "/verifycodesignup",     page: () => const VerifyCodeSignUp()),
  GetPage(name: "/onboarding",           page: () => const OnBoarding()),
  GetPage(name: "/homepage",             page: () => const HomeScreen()),
  GetPage(name: "/ordersdetails",        page: () => const OrdersDetails()),
  GetPage(name: "/orderstracking",       page: () => const OrdersTracking()),

];