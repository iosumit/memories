import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rememorise/apis/memories_api.dart';
import 'package:rememorise/blocs/memories_bloc.dart';
import 'package:rememorise/pages/home_screen.dart';
import 'package:rememorise/pages/note_detail.dart';
import 'package:rememorise/pages/splash_screen.dart';
import 'package:rememorise/repositories/memories_repository.dart';
import 'package:rememorise/utils/theme.dart';
import 'package:rememorise/widgets/snack_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final _router = GoRouter(
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) => const SplashScreen(key: Key('splash')),
          routes: [
            GoRoute(
                path: 'home',
                builder: (context, state) => const HomeScreen(
                      key: Key('home'),
                    ),
                routes: [
                  GoRoute(
                    path: 'detail',
                    builder: (context, state) => const NoteDetailScreen(
                      key: Key('detail'),
                    ),
                  )
                ]),
          ]),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) =>
                  MemoriesBloc(MemoriesRepository(MemoriesApi())))
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'ReMemorise',
          theme: buildTheme(Brightness.dark),
          routeInformationProvider: _router.routeInformationProvider,
          routeInformationParser: _router.routeInformationParser,
          routerDelegate: _router.routerDelegate,
          scaffoldMessengerKey: scaffoldMessengerKey,
        ));
  }
}
