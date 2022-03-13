import 'package:auto_route/auto_route.dart';

import '../ui/ui.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    CustomRoute(
      page: HomeScreen,
      initial: true,
      path: '/',
      transitionsBuilder: TransitionsBuilders.slideLeft,
    ),
    // CustomRoute(
    //   page: NoteDetailsScreen,
    //   path: '/details',
    //   transitionsBuilder: TransitionsBuilders.slideLeft,
    // ),
    // CustomRoute(
    //   page: SearchScreen,
    //   path: '/search',
    //   transitionsBuilder: TransitionsBuilders.slideTop,
    // ),
  ],
)
class $AppRouter {}
