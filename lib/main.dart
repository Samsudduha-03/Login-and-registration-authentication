import 'package:flutter/material.dart';
import 'package:id_card/auth/auth_gate.dart';
import 'package:id_card/pages/login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
      url: "https://ncyccnlvshaabrirxwiq.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5jeWNjbmx2c2hhYWJyaXJ4d2lxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzczODEzMjMsImV4cCI6MjA5Mjk1NzMyM30.OS6Yd_4FvMo5p73782r_eawvWUzr3jeuh2_ybT9OMh0");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital ID Card',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
      ),
      home: AuthGate(),
    );
  }
}
