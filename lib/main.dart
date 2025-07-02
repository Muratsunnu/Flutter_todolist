import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/models/task_model.dart';
import 'package:to_do_list/screens/home_page.dart';
import 'package:to_do_list/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // SharedPreferences için gerekli
  
  final taskProvider = TaskProvider();
  await taskProvider.loadTasks(); // Kayıtlı görevleri yükle

  runApp(
    ChangeNotifierProvider(
      create: (context) => taskProvider,
      child: const ToDoApp(),
    ),
  );
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do List',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          primary: Colors.black,
          secondary: const Color(0xFF1AB8DB),
        ),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      home: const SplashScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('Sayfa bulunamadı!'),
            ),
          ),
        );
      },
    );
  }
}