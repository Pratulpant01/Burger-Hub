import 'package:burgerhub/bloc/Add%20Quantity%20Bloc/add_quantity_bloc.dart';
import 'package:burgerhub/bloc/Admin%20Bloc/admin_bloc.dart';
import 'package:burgerhub/bloc/Auth%20Bloc/auth_bloc.dart';
import 'package:burgerhub/bloc/Cart%20Bloc/add_to_cart_bloc.dart';
import 'package:burgerhub/bloc/Product%20Bloc/product_bloc.dart';
import 'package:burgerhub/constants/constant.dart';
import 'package:burgerhub/services/category_services.dart';
import 'package:burgerhub/view/admin/admin_screen.dart';
import 'package:burgerhub/view/admin/admin_view/add_addons.dart';
import 'package:burgerhub/view/admin/services/admin_services.dart';
import 'package:burgerhub/view/auth/services/auth_services.dart';
import 'package:burgerhub/view/auth/signin_screen.dart';
import 'package:burgerhub/view/cart/cart_screen.dart';
import 'package:burgerhub/view/cart/services/cart_services.dart';
import 'package:burgerhub/view/screen_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthServices(),
        ),
        RepositoryProvider(
          create: (context) => AdminServices(),
        ),
        RepositoryProvider(
          create: (context) => CategoryServices(),
        ),
        RepositoryProvider(
          create: (context) => AddQuantityBloc(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              RepositoryProvider.of<AuthServices>(context),
            ),
          ),
          BlocProvider(
            create: (context) => ProductBloc(
              RepositoryProvider.of<CategoryServices>(context),
            )..add(getProductsEvent()),
          ),
          BlocProvider(
            create: (context) => AuthBloc(
              RepositoryProvider.of<AuthServices>(context),
            )..add(getUserDataEvent()),
          ),
          BlocProvider(
            create: (context) => AdminBloc(
              RepositoryProvider.of<AdminServices>(context),
            ),
          ),
          BlocProvider(
            create: (context) => AddQuantityBloc(),
          ),
          BlocProvider(
            create: (context) => AddToCartBloc(
              RepositoryProvider.of<AddQuantityBloc>(context),
              RepositoryProvider.of<CartServices>(context),
            ),
          ),

          // BlocProvider(
          //   create: (context) => AuthBloc(
          //     RepositoryProvider.of<AuthServices>(context),
          //   ),
          // )
        ],
        child: Container(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Burger Hub',
            theme: ThemeData(
              scaffoldBackgroundColor: bgSecondaryColor,
            ),
            home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, user) {
                if (user.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (user.hasData) {
                  return ScreenLayout();
                } else {
                  return SignInScreen();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
