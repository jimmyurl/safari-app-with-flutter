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
import 'package:tanzaniasafari/screens/login_signup_page.dart';
import 'package:tanzaniasafari/screens/search_screen.dart'; // Import SearchScreen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase
  await Supabase.initialize(
    url:
        'https://ajlzuhtyyaxlobcljusi.supabase.co', // Replace with your Supabase URL
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFqbHp1aHR5eWF4bG9iY2xqdXNpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjM3MTA1NTAsImV4cCI6MjAzOTI4NjU1MH0.3deZCnbg63e5JUgupnACPfpATw7ViKe9V08Eq9L5G74', // Replace with your Supabase anon key
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
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
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
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF211955),
          selectedItemColor: Colors.amberAccent,
          unselectedItemColor: Colors.white,
        ),
      ),
      home: _TanzaniaSafari(),
      routes: {
        '/home': (context) => HomePage(),
        '/search': (context) => SearchScreen(),
        '/trips': (context) => TripsScreen(),
        '/hotels': (context) => HotelsScreen(),
        '/activities': (context) => ActivitiesScreen(),
        '/restaurants': (context) => RestaurantsScreen(),
        '/flights': (context) => FlightsScreen(),
        '/login': (context) => LoginSignupPage(),
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
    Container(), // Placeholder for Search (handled with bottom sheet)
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
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      setState(() {
        isOnBoarding = false;
      });
    }
  }

  void _onBottomNavBarTap(int index) {
    if (index == 1) {
      _openSearchBottomSheet(); // Open the bottom sheet for search
    } else if (index == 6) {
      Navigator.pushNamed(context, '/login'); // Navigate to login page
    } else {
      setState(() {
        bottomNavBarIndex = index;
      });
    }
  }

  void _openSearchBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Search',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SearchScreen(), // Your search screen content
                  ),
                ],
              ),
            );
          },
        );
      },
    );
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
                    child: Image.asset(
                      'assets/icons/search.png',
                    ),
                  ),
                  label: 'Search',
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
                BottomNavigationBarItem(
                  icon: SizedBox(
                    width: 24,
                    height: 24,
                    child: Image.asset('assets/icons/login.png'),
                  ),
                  label: 'Login',
                ),
              ],
            )
          : null,
    );
  }
}
