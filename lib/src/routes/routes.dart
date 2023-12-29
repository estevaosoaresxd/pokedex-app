import "package:go_router/go_router.dart";
import "package:pokedex_app/src/models/pokemon_model.dart";
import "package:pokedex_app/src/pages/choose_auth/choose_auth_page.dart";
import "package:pokedex_app/src/pages/forgot_password/forgot_password_page.dart";
import "package:pokedex_app/src/pages/home/home_page.dart";
import "package:pokedex_app/src/pages/onboarding/onboarding_page.dart";
import "package:pokedex_app/src/pages/pokemon_detail/pokemon_detail_page.dart";
import "package:pokedex_app/src/pages/sign_in/sign_in_auth_page.dart";
import "package:pokedex_app/src/pages/sign_in/sign_in_page.dart";
import "package:pokedex_app/src/pages/sign_in/sign_in_sucess_page.dart";
import "package:pokedex_app/src/pages/sign_up/sign_up_auth_page.dart";
import "package:pokedex_app/src/pages/sign_up/sign_up_page.dart";
import "package:pokedex_app/src/pages/sign_up/sign_up_sucess_page.dart";
import "package:pokedex_app/src/pages/splash/splash_page.dart";

// GoRouter configuration
class Routes {
  static GoRouter routes = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        name: "splash",
        path: "/",
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        name: "onboarding",
        path: "/onboarding",
        builder: (context, state) => const OnboardPage(),
      ),
      GoRoute(
        name: "choose-auth",
        path: "/choose-auth",
        builder: (context, state) => const ChooseAuthPage(),
      ),
      GoRoute(
        name: "sign-in",
        path: "/sign-in",
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        name: "sign-in-auth",
        path: "/sign-in-auth",
        builder: (context, state) => const SignInAuthPage(),
      ),
      GoRoute(
        name: "sign-in-sucess",
        path: "/sign-in-sucess",
        builder: (context, state) => const SignInSucessPage(),
      ),
      GoRoute(
        name: "sign-up",
        path: "/sign-up",
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        name: "sign-up-auth",
        path: "/sign-up-auth",
        builder: (context, state) => const SignUpAuthPage(),
      ),
      GoRoute(
        name: "sign-up-sucess",
        path: "/sign-up-sucess",
        builder: (context, state) => const SignUpSucessPage(),
      ),
      GoRoute(
        name: "forgot-password",
        path: "/forgot-password",
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      GoRoute(
        name: "home",
        path: "/home",
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        name: "pokemon-detail",
        path: "/pokemon-detail",
        builder: (context, state) => PokemonDetailPage(
          pokemon: state.extra as PokemonModel,
        ),
      ),
    ],
  );
}
