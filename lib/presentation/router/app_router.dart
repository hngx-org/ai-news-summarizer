import 'package:flutter/material.dart';
import 'package:legal_document_generator/presentation/auth/screens/register.dart';
import 'package:legal_document_generator/presentation/auth/screens/sign_in.dart';
import 'package:legal_document_generator/presentation/create_document/create_document_screen.dart';
import 'package:legal_document_generator/presentation/home_screen/home_screen.dart';
import 'package:legal_document_generator/presentation/onBoarding_screen/onBoarding_screen.dart';

import '../splash_screen/splash_screen.dart';


class AppRouter {
  /// A custom screen navigation handler that handles the animation of moving from one screen to another
  /// The current setting sets up the app to mimic the navigation on IOS devices on every of our app variant
  ///
  static _getPageRoute(
      Widget child, [
        String? routeName,
        dynamic args,
      ]) =>
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => child,
        settings: RouteSettings(
          name: routeName,
          arguments: args,
        ),
        transitionDuration: const Duration(milliseconds: 200),
        reverseTransitionDuration: const Duration(milliseconds: 200),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;
          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(
            CurveTween(curve: curve),
          );
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );

  /// This is used to generate routes and manage routes in our flutter app.
  /// This supports stacking and persistence as we are using the named method.
  /// Therefore for we to stack pages on each other every page has to handle it's own data and state
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return _getPageRoute(const SplashScreen());
      case HomeScreen.routeName:
        return _getPageRoute(const HomeScreen());
      case CreateDocument.routeName:
        return _getPageRoute(const CreateDocument());
      case OnBoardingScreen.routeName:
        return _getPageRoute(const OnBoardingScreen());
      case SignIn.routeName:
        return _getPageRoute(const SignIn());
      case RegistrationForm.routeName:
        return _getPageRoute(const RegistrationForm());

      default:
        return _getPageRoute(const SplashScreen());
    }
  }
}
