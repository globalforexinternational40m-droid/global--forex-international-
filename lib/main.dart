import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

void main() => runApp(GlobalForexApp());

class GlobalForexApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Global Forex International',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        primaryColor: Color(0xFF00D1FF),
        colorScheme: ColorScheme.dark(primary: Color(0xFF00D1FF), secondary: Color(0xFF00FF88)),
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => MainScreen())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF0A0E21), Color(0xFF1D1E33)], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(Icons.show_chart, size: 100, color: Color(0xFF00D1FF)),
            SizedBox(height: 20),
            Text("GLOBAL FOREX", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 3)),
            Text("INTERNATIONAL", style: TextStyle(fontSize: 18, color: Color(0xFF00FF88), letterSpacing: 5)),
            SizedBox(height: 30),
            CircularProgressIndicator(color: Color(0xFF00D1FF)),
          ]),
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {
  int _index = 0;
  final pages = [DashboardPage(), MarketsPage(), SignalsPage(), WalletPage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF1D1E33),
        selectedItemColor: Color(0xFF00D1FF),
        unselectedItemColor: Colors.white54,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Dashboard"),
          BottomNavigationBarItem(icon: Icon(Icons.candlestick_chart), label: "Markets"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_active), label: "Signals"),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: "Wallet"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}
class _DashboardPageState extends State<DashboardPage> {
  double balance = 40258300.75;
  Timer? timer;
  final random = Random();
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 2), (_) {
      setState(() => balance += random.nextDouble() * 500 - 100);
    });
  }
  @override
  void dispose() { timer?.cancel(); super.dispose(); }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Good Morning, Trader", style: TextStyle(color: Colors.white54)),
              Text("Global Forex Intl", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ]),
            CircleAvatar
