import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:pokedex_app/src/routes/routes.dart";
import "package:pokedex_app/src/shared/themes/text_themes.dart";
import "firebase_options.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Pokedex-App",
      routerConfig: Routes.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins",
        textTheme: TextThemes.theme,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF173EA5),
          primary: const Color(0xFF173EA5),
          secondary: const Color(0xFF000029),
        ),
        useMaterial3: true,
      ),
    );
  }
}
