import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/videos/views/video_recording_screen.dart';
import 'auth/login_screen.dart';
import 'auth/sign_up_screen.dart';
import 'common/main_navigation/main_navigation_screen.dart';
import 'inbox/activity_screen.dart';
import 'inbox/chat_detail_screen.dart';
import 'inbox/chats_screen.dart';
import 'onboarding/interests_screen.dart';

final router = GoRouter(
  initialLocation: "/inbox",
  routes: [
    GoRoute(
      name: SignUpScreen.routeName,
      path: SignUpScreen.routeURL,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      name: LoginScreen.routeName,
      path: LoginScreen.routeURL,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: InterestsScreen.routeName,
      path: InterestsScreen.routeURL,
      builder: (context, state) => const InterestsScreen(),
    ),
    GoRoute(
      path: "/:tab(home|discover|inbox|profile)",
      name: MainNavigationScreen.routeName,
      builder: (context, state) {
        final tab = state.pathParameters["tab"]!;
        return MainNavigationScreen(tab: tab);
      },
    ),
    GoRoute(
      name: ActivityScreen.routeName,
      path: ActivityScreen.routeURL,
      builder: (context, state) => const ActivityScreen(),
    ),
    GoRoute(
      name: ChatsScreen.routeName,
      path: ChatsScreen.routeURL,
      builder: (context, state) => const ChatsScreen(),
      routes: [
        GoRoute(
          name: ChatDetailScreen.routeName,
          path: ChatDetailScreen.routeURL,
          builder: (context, state) {
            final chatId = state.pathParameters["chatId"]!;
            return ChatDetailScreen(
              chatId: chatId,
            );
          },
        )
      ],
    ),
    GoRoute(
      path: VideoRecordingScreen.routeURL,
      name: VideoRecordingScreen.routeName,
      pageBuilder: (context, state) => CustomTransitionPage(
        transitionDuration: const Duration(milliseconds: 200),
        child: const VideoRecordingScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final position = Tween(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(animation);
          return SlideTransition(
            position: position,
            child: child,
          );
        },
      ),
    ),
  ],
);

//   name: SignUpScreen.routeName,
//   path: SignUpScreen.routeURL,
//   builder: (context, state) => const SignUpScreen(),
//   routes: [
//     GoRoute(
//       path: UsernameScreen.routeURL,
//       name: UsernameScreen.routeName,
//       builder: (context, state) => const UsernameScreen(),
//       routes: [
//         GoRoute(
//           name: EmailScreen.routeName,
//           path: EmailScreen.routeURL,
//           builder: (context, state) {
//             final args = state.extra as EmailScreenArgs;
//             return EmailScreen(username: args.username);
//           },
//         ),
//       ],
//     ),
//   ],
// ),
/* GoRoute(
      path: LoginScreen.routeName,
      builder: (context, state) => const LoginScreen(),
    ), */
/*  GoRoute(
      name: "username_screen",
      path: UsernameScreen.routeName,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: const UsernameScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(
                scale: animation,
                child: child,
              ),
            );
          },
        );
      },
    ), */
//     GoRoute(
//       path: "/users/:username",
//       builder: (context, state) {
//         final username = state.pathParameters['username'];
//         final tab = state.uri.queryParameters["show"];
//         return UserProfileScreen(username: username!, tab: tab!);
//       },
//     )
//   ],
// );
