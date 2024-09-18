import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart'; // Import Supabase package
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package
import 'package:tanzaniasafari/screens/activity_screen.dart';
import 'package:tanzaniasafari/screens/flights_screen.dart';
import 'package:tanzaniasafari/screens/homepage.dart';
import 'package:tanzaniasafari/screens/hotels_screen.dart';
import 'package:tanzaniasafari/screens/restaurant_screen.dart';
import 'package:tanzaniasafari/screens/trips_screen.dart';
import 'package:tanzaniasafari/screens/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase
  await Supabase.initialize(
    url:
        'your-supabase-url', // Replace with your Supabase URL
    anonKey:
        'your-supabase-key', // Replace with your Supabase anon key
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Safari UI',
      theme: ThemeData(
        // Apply global text theme with Poppins font
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        // Customize primary color, scaffold background, etc.
        primaryColor: const Color(0xFF211955),
        scaffoldBackgroundColor: const Color(0xFFF5EDDC),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFFF5EDDC),
          titleTextStyle: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF211955),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: const Color(0xFF211955),
          selectedItemColor: Colors.amberAccent,
          unselectedItemColor: Colors.white,
        ),
      ),
      home: _TanzaniaSafari(),
      routes: {
        '/home': (context) => HomePage(),
        '/trips': (context) => TripsScreen(),
        '/hotels': (context) => HotelsScreen(),
        '/activities': (context) => ActivitiesScreen(),
        '/restaurants': (context) => RestaurantsScreen(),
        '/flights': (context) => FlightsScreen(),
      },
    );
  }
}

class _TanzaniaSafari extends StatefulWidget {
  @override
  _TanzaniaSafariState createState() => _TanzaniaSafariState();
}

class _TanzaniaSafariState extends State<_TanzaniaSafari> {
  bool isOnBoarding = true;
  int bottomNavBarIndex = 0;

  final List<Widget> pages = [
    HomePage(),
    TripsScreen(),
    HotelsScreen(),
    RestaurantsScreen(),
    FlightsScreen(),
    ActivitiesScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _checkOnboarding();
  }

  void _checkOnboarding() async {
    // Simulate onboarding check
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      setState(() {
        isOnBoarding = false;
      });
    }
  }

  void _onBottomNavBarTap(int index) {
    setState(() {
      bottomNavBarIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5EDDC),
      appBar: !isOnBoarding
          ? AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/tembo.png', // Your logo asset
                    width: 105,
                    height: 105,
                  ),
                ],
              ),
            )
          : null,
      body: isOnBoarding ? const OnboardingScreen() : pages[bottomNavBarIndex],
      bottomNavigationBar: !isOnBoarding
          ? BottomNavigationBar(
              currentIndex: bottomNavBarIndex,
              onTap: _onBottomNavBarTap,
              items: [
                BottomNavigationBarItem(
                  icon: SizedBox(
                    width: 24,
                    height: 24,
                    child: Image.asset('assets/icons/home.png'),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: SizedBox(
                    width: 24,
                    height: 24,
                    child: Image.asset('assets/icons/attractions.png'),
                  ),
                  label: 'Attractions',
                ),
                BottomNavigationBarItem(
                  icon: SizedBox(
                    width: 24,
                    height: 24,
                    child: Image.asset('assets/icons/hotels.png'),
                  ),
                  label: 'Stays',
                ),
                BottomNavigationBarItem(
                  icon: SizedBox(
                    width: 24,
                    height: 24,
                    child: Image.asset('assets/icons/culture.png'),
                  ),
                  label: 'Culture',
                ),
                BottomNavigationBarItem(
                  icon: SizedBox(
                    width: 24,
                    height: 24,
                    child: Image.asset('assets/icons/transports.png'),
                  ),
                  label: 'Transports',
                ),
              ],
            )
          : null,
    );
  }
}
