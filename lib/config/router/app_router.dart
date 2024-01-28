import 'package:go_router/go_router.dart';
import 'package:shoes_app/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ShoePage()
    ),
    GoRoute(
      path: '/shoe',
      builder: (context, state) => const ShoePage()
    ),
  ]
);