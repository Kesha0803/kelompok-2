import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'consts/consts.dart';
import 'screens/product_list_screen.dart';
import 'providers/cart_provider.dart';
import 'providers/favorite_provider.dart';
import 'screens/cart_screen.dart';
import 'screens/favorites_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appname,
        theme: ThemeData(
          primarySwatch: Colors.pink,
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.pink,
            primary: Colors.pink,
            secondary: Colors.purple,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.pink,
            foregroundColor: Colors.white,
            elevation: 0,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink,
              foregroundColor: Colors.white,
            ),
          ),
          textTheme: const TextTheme(
            headlineLarge: TextStyle(
              color: Colors.pink,
              fontWeight: FontWeight.bold,
            ),
            headlineMedium: TextStyle(
              color: Colors.purple,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        home: const MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const ProductListScreen(),
    const FavoritesScreen(),
    const CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Keranjang',
          ),
        ],
      ),
    );
  }
}
