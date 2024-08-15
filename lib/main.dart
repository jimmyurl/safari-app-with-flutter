import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart'; // Import Supabase package
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
        'https://your-supabase-url.supabase.co', // Replace with your Supabase URL
    anonKey: 'your-supabase-anon-key', // Replace with your Supabase anon key
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Safari UI',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/trips': (context) => const TripsScreen(),
        '/hotels': (context) => const HotelsScreen(),
        '/activities': (context) => const ActivitiesScreen(),
        '/restaurants': (context) => const RestaurantsScreen(),
        '/flights': (context) => FlightsScreen(),
        '/home': (context) => const HomePage(),
      },
      builder: (context, child) {
        return _TanzaniaSafari(
          navigator: GlobalKey<NavigatorState>(),
          child: child!,
        );
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/hotels') {
          final args = settings.arguments as Map<String, dynamic>;
          final destination = args['destination'] as String;

          return MaterialPageRoute(
            builder: (context) => HotelsScreen(),
          );
        }
        return null;
      },
    );
  }
}

class _TanzaniaSafari extends StatefulWidget {
  const _TanzaniaSafari({
    Key? key,
    required this.navigator,
    required this.child,
  }) : super(key: key);

  final GlobalKey<NavigatorState>? navigator;
  final Widget child;

  @override
  __TanzaniaSafariState createState() => __TanzaniaSafariState();
}

class __TanzaniaSafariState extends State<_TanzaniaSafari> {
  bool isOnBoarding = true;
  int bottomNavBarIndex = 0;

  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      HomePage(),
      TripsScreen(),
      HotelsScreen(),
      RestaurantsScreen(),
      FlightsScreen(),
      const ActivitiesScreen(),
    ];

    // Simulate a delay and then navigate to the homepage
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isOnBoarding = false;
      });
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  void _onBottomNavBarTap(int index) {
    setState(() {
      bottomNavBarIndex = index;
    });

    if (index == 5 && widget.navigator?.currentContext != null) {
      Navigator.of(widget.navigator!.currentContext!).pushNamed('/trips');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFF5EDDC), // Set background color
        appBar: isOnBoarding
            ? null // Remove the app bar during onboarding
            : AppBar(
                backgroundColor: Colors.amberAccent,
                automaticallyImplyLeading: false,
                centerTitle: true, // Center the title (logo) horizontally
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/tembo.png', // Replace with your logo image asset path
                      width: 105, // Adjust the width as needed
                      height: 105, // Adjust the height as needed
                    ),
                  ],
                ),
              ),
        body: isOnBoarding
            ? const OnboardingScreen() // Use the OnboardingScreen without onComplete
            : pages[bottomNavBarIndex],
        bottomNavigationBar: !isOnBoarding
            ? BottomNavigationBar(
                backgroundColor: const Color(0xFF211955),
                selectedItemColor: Colors.amberAccent,
                unselectedItemColor: const Color(0xFF211955),
                currentIndex: bottomNavBarIndex,
                onTap: _onBottomNavBarTap,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.turn_sharp_right_sharp),
                    label: 'Attractions',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.hotel),
                    label: 'Stays',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.emoji_nature),
                    label: 'Culture',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.emoji_transportation),
                    label: 'Transports',
                  ),
                ],
              )
            : null,
      ),
    );
  }
}
