import 'package:flutter/material.dart';

import '../modules/auth/auth.dart';
import '../modules/home/home.dart';
import '../modules/order/order.dart';
import '../modules/product/product.dart';
import '../modules/store/pages/page.dart';
import 'shared.dart';

class Routes {
  Routes._();

  // static variable url page
  static const String login = '/login';
  static const String register = '/register';
  static const String forgetPass = '/forgetPass';
  static const String onboardingStore = '/onBoardingStore';
  static const String main = '/main';
  static const String detailOrder = '/detailOrder';
  static const String deliveryStatus = '/deliveryStatus';
  static const String selectCategory = '/selectCategory';
  static const String createProduct = '/createProduct';

  static Route<dynamic> routes(RouteSettings settings) {
    // argument data
    final args = settings.arguments;

    switch (settings.name) {
      case login:
        return SlideTransitionPage(child: LoginPage());
        break;
      case register:
        return SlideTransitionPage(child: RegisterPage());
        break;
      case forgetPass:
        return SlideTransitionPage(child: ForgetPasswordPage());
        break;
      case onboardingStore:
        return SlideTransitionPage(child: OnboardingStorePage());
        break;
      case main:
        return SlideTransitionPage(child: MainPage());
        break;
      case detailOrder:
        return SlideTransitionPage(child: DetailOrderPage());
        break;
      case deliveryStatus:
        return SlideTransitionPage(child: DeliveryStatusPage());
        break;
      case selectCategory:
        return SlideTransitionPage(child: SelectCategoryPage());
        break;
      case createProduct:
        return SlideTransitionPage(child: CreateProductPage());
        break;
      default:
        // TODO: update undefine page
        return SlideTransitionPage(child: Container());
    }
  }
}
