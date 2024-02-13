import 'package:flutter/material.dart';
import 'package:super_store/navigator/route_name.dart';

import '../registration/login_screen.dart';
import '../registration/signup_screen.dart';
import '../registration/splash_screen.dart';
import '../screen_view/address_details.dart';
import '../screen_view/cart_icon_manage.dart';
import '../screen_view/homepage.dart';
import '../screen_view/product_details.dart';
import '../screen_view/shopping_cart.dart';

class Routes {
  // Example: Initialize your Cart instance
  static Cart cart = Cart();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splashscreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case RouteName.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case RouteName.signupScreen:
        return MaterialPageRoute(builder: (_) => const SignupScreen());

      case RouteName.productDetails:
        return _buildProductDetailsRoute(settings);

      case RouteName.addressDetails:
        return _buildAddressDetailsRoute(settings);

      case RouteName.homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case RouteName.shoppingCart:
        return _buildShoppingCartRoute(settings);

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text('No route defined')),
          );
        });
    }
  }

  static MaterialPageRoute _buildProductDetailsRoute(RouteSettings settings) {
    final Map<String, dynamic> arguments = settings.arguments as Map<
        String,
        dynamic>;
    final String productName = arguments['productName'] ?? '';
    final String price = arguments['price'] ?? '';
    final String imageUrl = arguments['imageUrl'] ?? '';
    final String size = arguments['size'] ?? '';

    return MaterialPageRoute(
      builder: (_) =>
          ProductDetailsPage(
            productName: productName,
            price: price,
            imageUrl: imageUrl,
            size: size,
            data: const {},
          ),
    );
  }

  static MaterialPageRoute _buildAddressDetailsRoute(RouteSettings settings) {
    final Map<String, dynamic> arguments = settings.arguments as Map<
        String,
        dynamic>;
    final String productName = arguments['productName'] ?? '';
    final String price = arguments['price'] ?? '';
    final String imageUrl = arguments['imageUrl'] ?? '';
    final String size = arguments['size'] ?? '';

    return MaterialPageRoute(
      builder: (_) =>
          AddressDetails(
            productName: productName,
            price: price,
            imageUrl: imageUrl,
            size: size,
            data: null,
          ),
    );
  }

  static MaterialPageRoute _buildShoppingCartRoute(RouteSettings settings) {
    final Map<String, dynamic>? arguments = settings.arguments as Map<
        String,
        dynamic>?;

    if (arguments != null) {
      final String productName = arguments['productName'] ?? '';
      final String price = arguments['price'] ?? '';
      final String imageUrl = arguments['imageUrl'] ?? '';

      return MaterialPageRoute(
        builder: (_) =>
            ShoppingCart(
              productName: productName,
              price: price,
              imageUrl: imageUrl,
              cart: cart,
            ),
      );
    } else {
      // Handle the case where arguments are null or not in the expected format
      return MaterialPageRoute(builder: (_) {
        return const Scaffold(
          body: Center(child: Text('Invalid arguments for shopping cart')),
        );
      });
    }
  }
  }
