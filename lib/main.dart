import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_de/config/theme/app_theme.dart';
import 'package:yes_no_app_de/presentation/providers/chat_provider.dart';
import 'package:yes_no_app_de/presentation/screens/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider())
      ], //todos los widgets tienen acceso al provider
      child: MaterialApp(
          title: 'Yes No App',
          debugShowCheckedModeBanner: false,
          theme: AppTheme(selectedColor: 1).theme(),
          home: const ChatScreen()),
    );
  }
}
