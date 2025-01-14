import 'package:huls_coffee_house/pages/admin/inventory/inventory.dart';
import 'package:huls_coffee_house/pages/cart_ui/utils/cart.dart';
import 'package:huls_coffee_house/pages/login_ui/signup_page.dart';
import 'package:huls_coffee_house/pages/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:huls_coffee_house/pages/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load(fileName: '.env');
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await LocalDatabase.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme:
                const TextTheme(bodySmall: TextStyle(fontFamily: 'SofiaPro'))),
        routes: {
          SplashScreen.routeName: (context) => const SplashScreen(),
          Homepage.routeName: (context) => const Homepage(),
          LoginPage.routeName: (context) => const LoginPage(),
          SignupPage.routeName: (context) => const SignupPage(),
          ViewAll.routeName: (context) => ViewAll(),
          // Test.routeName: (context) => const Test(),
          CartPage.routeName: (context) => const CartPage(),
          OtpVerificationPage.routeName: (context) =>
              const OtpVerificationPage(),
          CheckoutPage.routeName: (context) {
            final args = ModalRoute.of(context)?.settings.arguments
                as Map<String, dynamic>;
            final checkoutItems = args['checkoutItems'];
            return CheckoutPage(checkoutItems: checkoutItems);
          },
          OrderPage.routeName: (context) => const OrderPage(),
          Inventory.routeName: (context) => const Inventory(),
          OrderSuccessfulPage.routeName: (context) =>
              const OrderSuccessfulPage()
        },
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
