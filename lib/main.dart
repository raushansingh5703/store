import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/screens/store_screen/store_screen.dart';
import 'constants/app_colors.dart';
import 'providers/store_provider.dart';

void main() {
  runApp(const StoreLocatorApp());
}

class StoreLocatorApp extends StatelessWidget {
  const StoreLocatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => StoreProvider(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.primaryColor,
            foregroundColor: Colors.white,
          ),
          cardColor: Colors.white,
          scaffoldBackgroundColor: Colors.grey[100],
        ),
        home: const StoreScreen(),
      ),
    );
  }
}
